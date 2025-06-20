import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondam_app/view/store/store_pos/store_sales_report/store_product_analysis.dart';
import 'package:ondam_app/view/store/store_pos/store_sales_report/store_sales_detail.dart';
import 'package:ondam_app/view/store/store_pos/store_sales_report/store_sales_status.dart';
import 'package:ondam_app/vm/side_menu_controller.dart';
import 'package:ondam_app/vm/vm_handler_temp.dart';

class StoreProductTab extends StatelessWidget {
  StoreProductTab({super.key});
  final vmHandler = Get.find<VmHandlerTemp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(color: const Color.fromRGBO(46, 61, 83, 1)),
            child: 
                ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
                            child: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back),color: Colors.white,),
                          ),
                          Text('매출 리포트', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),)]
                        ),
                    ),
                    _buildTile(vmHandler, 1, Icons.store, '매출 현황'),
                    _buildTile(vmHandler, 2, Icons.store, '매출 상세'),
                    _buildTile(vmHandler, 3, Icons.store, '상품 분석'),
                  ],
                ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Obx(() {
            switch (vmHandler.selectedStoreReportProductIndex.value){
              case 1:
                return StoreSalesStatus();
              case 2:
                return StoreSalesDetail();
              case 3:
                return StoreProductAnalysis();
              default:
                return Center(child: Text('페이지를 선택해 주세요'),);
            }
          },),
        )
      ],
    ) 
    );
    
  }

  Widget _buildTile(SideMenuController vmHandler, int index, IconData icon, String title){
    return Obx(() {
      final isSelected = vmHandler.selectedStoreReportProductIndex.value == index;

      return Container(
        color: isSelected ? Color(0xFFF6F7FB) : Colors.transparent,
        child: ListTile(
          onTap: () {
            vmHandler.selectProductIdex(index);
          },
          leading: Icon(icon, color: isSelected ? Colors.black : Colors.white,size: 32),
          title: Text(
            title,
            style: TextStyle(color: isSelected ? Colors.black : Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
      );
    },);
}}