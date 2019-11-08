import 'package:flutter/material.dart';

class YSBottomSheet {
  final clickBlock;
  static BuildContext currentContext;
  static init(BuildContext context) {
    currentContext = context;
  }

  YSBottomSheet(this.clickBlock);

  static showSheet(itemArr, clickBlock) {
    showModalBottomSheet(
        context: currentContext,
        builder: (BuildContext context) {
          return Container(
            color: Colors.white,
            child: GestureDetector(
              child: BottomModal(
                itemArr: itemArr,
                clickBlock: clickBlock,
              ),
            ),
          );
        });
  }
}

class BottomModal extends StatefulWidget {
  final clickBlock;
  final itemArr;

  const BottomModal({Key key, this.itemArr, this.clickBlock}) : super(key: key);

  @override
  State createState() {
    return _BottomModalState(this.itemArr, this.clickBlock);
  }
}

class _BottomModalState extends State {
  final clickBlock;
  final itemArr;
  _BottomModalState(this.itemArr, this.clickBlock);

  List<Widget> _itemList() {
    List<Widget> itemList = List();
    for (int i = 0; i < this.itemArr.length; i++) {
      String title = itemArr[i];
      Widget item = InkWell(
        child: Container(
          height: 50,
          alignment: AlignmentDirectional.center,
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
          _itemClick(i+1);
        },
      );

      itemList.add(item);
    }

    Widget div = Container(
      height: 10,
      color: Colors.grey[100],
    );
    Widget cancel = InkWell(
      child: Container(
        height: 50,
        alignment: AlignmentDirectional.center,
        child: Text(
          "取消",
          style: TextStyle(fontSize: 18),
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        _itemClick(this.itemArr.length+1);
      },
    );

    itemList.add(div);
    itemList.add(cancel);

    return itemList;
  }

  @override
  Widget build(BuildContext context) {

    int allH = (itemArr.length + 1) * 50 + 10;
    return Container(
      height: allH.toDouble(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _itemList()
      ),
    );
  }

  _itemClick(int index) {
    clickBlock(index);
  }
}
