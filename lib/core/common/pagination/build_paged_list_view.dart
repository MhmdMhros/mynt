// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:mynt/core/common/pagination/list_page.dart';
import 'package:mynt/core/resources/strings_manager.dart';

import '../state_renderer/state_renderer.dart';

class BuildPagedListView<T> extends StatefulWidget {
  const BuildPagedListView({
    Key? key,
    required this.buildItem,
    this.loadingWidget,
    this.emptyWidget,
    this.separatorWidget,
    this.emptyWidgetAnimationImage,
    this.emptyWidgetMessage,
    required this.pagingController,
    required this.fetchData,
    this.padding,
    this.gridDelegate,
    this.loadingPadding,
    this.isGrid = false,
    this.isPrimary = true,
    this.shrinkWrap = false,
    this.disposeController = true,
    this.isReverse = false,
  }) : super(key: key);
  final Widget Function(dynamic item, int index) buildItem;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? separatorWidget;
  final String? emptyWidgetAnimationImage;
  final String? emptyWidgetMessage;
  final PagingController pagingController;
  final Future<ListPage> Function(int page, int limit) fetchData;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? loadingPadding;
  final bool isGrid;
  final bool isPrimary;
  final bool shrinkWrap;
  final bool disposeController;
  final SliverGridDelegate? gridDelegate;
  final bool isReverse;

  @override
  State<BuildPagedListView> createState() => _BuildPagedListViewState();
}

class _BuildPagedListViewState<T> extends State<BuildPagedListView> {
  late final PagingController<int, T> _pagingController;
  late void Function(int) _pageRequestListener;

  @override
  void initState() {
    super.initState();
    _pagingController = widget.pagingController as PagingController<int, T>;
    _pageRequestListener = (pageKey) {
      _fetchPage(pageKey);
    };
    _pagingController.addPageRequestListener(_pageRequestListener);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newPage = await widget.fetchData(pageKey, 10);
      if (!mounted) return;

      final previouslyFetchedItemsCount =
          _pagingController.itemList?.length ?? 0;

      final isLastPage = newPage.isLastPage(previouslyFetchedItemsCount);
      final newItems = newPage.itemList as List<T>;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      if (mounted) {
        _pagingController.error = error;
      }
    }
  }

  @override
  void dispose() {
    if (widget.disposeController) {
      _pagingController.removePageRequestListener(_pageRequestListener);
      _pagingController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: widget.isGrid
          ? PagedGridView<int, T>(
              reverse: widget.isReverse,
              primary: widget.isPrimary,
              shrinkWrap: widget.shrinkWrap,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              gridDelegate: widget.gridDelegate ??
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                  ),
              physics: !widget.isPrimary
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
              pagingController: _pagingController,
              builderDelegate: buildDelegate(),
            )
          : PagedListView<int, T>.separated(
              reverse: widget.isReverse,
              primary: widget.isPrimary,
              shrinkWrap: widget.shrinkWrap,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: !widget.isPrimary
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
              pagingController: _pagingController,
              builderDelegate: buildDelegate(),
              separatorBuilder: (context, index) =>
                  widget.separatorWidget ?? SizedBox(height: 0.h),
            ),
    );
  }

  PagedChildBuilderDelegate<T> buildDelegate() {
    return PagedChildBuilderDelegate(
      itemBuilder: (context, item, index) {
        return widget.buildItem(item, index);
      },
      firstPageProgressIndicatorBuilder: (context) {
        late Widget loadingWidget;
        if (widget.loadingWidget == null) {
          loadingWidget = const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (widget.isGrid) {
            loadingWidget = Column(
              children: List.generate(
                  10,
                  (index) => Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Row(
                          children: [
                            Expanded(child: widget.loadingWidget!),
                            SizedBox(width: 16.w),
                            Expanded(child: widget.loadingWidget!),
                          ],
                        ),
                      )),
            );
          } else {
            loadingWidget = Column(
              children: List.generate(10, (index) => widget.loadingWidget!),
            );
          }
        }

        return Padding(
          padding: widget.loadingPadding ?? EdgeInsets.zero,
          child: loadingWidget,
        );
      },
      firstPageErrorIndicatorBuilder: (context) => StateRenderer(
        stateRendererType: StateRendererType.fullScreenErrorState,
        retryActionFunction: _pagingController.refresh,
        message: _pagingController.error,
      ),
      newPageErrorIndicatorBuilder: (context) => InkWell(
        onTap: () {
          _pagingController.retryLastFailedRequest();
        },
        child: Column(
          children: [
            Text(
              AppStrings.somethingWengtWrongTryAgain,
              style: TextStyle(
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.center,
            ),
            const Icon(Icons.refresh)
          ],
        ),
      ),
      noItemsFoundIndicatorBuilder: (context) =>
          widget.emptyWidget ??
          StateRenderer(
            stateRendererType: StateRendererType.fullScreenEmptyState,
            retryActionFunction: _pagingController.refresh,
            message: widget.emptyWidgetMessage ?? '',
            animationImage: widget.emptyWidgetAnimationImage,
          ),
    );
  }
}
