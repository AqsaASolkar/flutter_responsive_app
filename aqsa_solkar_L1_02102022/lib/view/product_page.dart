import 'package:aqsa_solkar_l1_02102022/res/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:aqsa_solkar_l1_02102022/model/ProductListResponse.dart';
import 'package:aqsa_solkar_l1_02102022/res/constant.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {
  final bool isMobile;
  const ProductsView({Key? key, this.isMobile = false}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView>
    with SingleTickerProviderStateMixin {
  ProductListResponse productListResponse = ProductListResponse();
  List<Products>? selectedProduct = [];

  @override
  void initState() {
    var jsonData = {
      "product_data": [
        {
          "name": "New Delicacies",
          "quantity": 3,
          "products": [
            {"image": "delicacies1", "price": "5", "product_name": "Cookies"},
            {"image": "delicacies2", "price": "6", "product_name": "Croissant"},
            {"image": "delicacies3", "price": "4", "product_name": "Croissant"}
          ]
        },
        {
          "name": "Hot Coffee",
          "quantity": 4,
          "products": [
            {"image": "coffee1", "price": "7", "product_name": "Black Coffee"},
            {"image": "coffee2", "price": "12", "product_name": "Pure Coffee"},
            {"image": "coffee3", "price": "9", "product_name": "Milk Coffee"},
            {"image": "coffee4", "price": "9", "product_name": "Moka Coffee"}
          ]
        },
        {
          "name": "Cakes And Delicacies",
          "quantity": 4,
          "products": [
            {"image": "cake1", "price": "6", "product_name": "Cream Cake"},
            {
              "image": "cake2",
              "price": "5",
              "product_name": "Chocolate Croissant"
            },
            {"image": "cake3", "price": "15", "product_name": "Pancake"},
            {"image": "cake4", "price": "12", "product_name": "Milk Cake"}
          ]
        }
      ]
    };
    productListResponse = ProductListResponse.fromJson(jsonData);
    selectedProduct = productListResponse.productData?.first.products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildContent();
  }

  buildContent() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
          vertical: MediaQuery.of(context).size.height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(),
          tabs(),
          widget.isMobile
              ? const Center(
                  child: Text('Products'),
                )
              : buildGrid(),
        ],
      ),
    );
  }

  Widget title() {
    return heading(text: 'Choose our delicious and best products');
  }

  Widget tabs() {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: ListView.builder(
        itemCount: productListResponse.productData?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          ProductData productData = productListResponse.productData![index];
          return tabDetails(productData, onTap: () {
            setState(() {
              selectedProduct = productData.products;
            });
          },
              showDivider:
                  !((productListResponse.productData!.length - 1) == index));
        },
      ),
    );
  }

  Widget tabDetails(ProductData productData,
      {Function? onTap, bool showDivider = true}) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            onTap?.call();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                productData.name ?? '',
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                "${productData.quantity ?? ''} products",
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        if (showDivider)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            height: 30,
            width: 1,
            color: Colors.grey,
          )
      ],
    );
  }

  Widget buildGrid() {
    return GridView.builder(
        itemCount: selectedProduct?.length ?? 0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 290,
            crossAxisCount: 3,
            crossAxisSpacing: 50,
            mainAxisSpacing: 20),
        itemBuilder: (BuildContext context, int index) {
          Products product = selectedProduct![index];
          return ProductDetails(product: product);
        });
  }
}

class ProductDetails extends StatefulWidget {
  final Products product;
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  Animation<Offset>? animationOffset;
  late AnimationController productAnimationController;
  Animation<double>? animationOpacity;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    var curved =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animationOffset =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, -0.15))
            .animate(curved);

    productAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    var curved1 = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubicEmphasized);
    animationOpacity = Tween<double>(begin: 400, end: 200).animate(curved1);
    productAnimationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return product();
  }

  Widget product() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 2, offset: Offset(0, 2))
          ]),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: InkWell(
                  onTap: () {},
                  onHover: (isHover) {
                    {
                      if (isHover) {
                        setState(() {
                          animationController.forward();
                        });
                      } else {
                        setState(() {
                          animationController.reverse();
                        });
                      }
                    }
                  },
                  child: SliderAnimation(
                    animationOffset: animationOffset!,
                    child: Image.asset(
                      widget.product.image?.toPng ?? '',
                      height: 150,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "\$${widget.product.price}",
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${widget.product.productName}",
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          ),
          // Container(
          //   height: 40,
          //   decoration: const BoxDecoration(
          //       shape: BoxShape.circle, color: Colors.black),
          // )
        ],
      ),
    );
  }
}

class SliderAnimation extends StatefulWidget {
  final Widget child;
  final Animation<Offset> animationOffset;
  const SliderAnimation(
      {Key? key, required this.child, required this.animationOffset})
      : super(key: key);

  @override
  State<SliderAnimation> createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // animationController =
    //     AnimationController(vsync: this, duration: const Duration(seconds: 1));
    // var curved =
    // CurvedAnimation(parent: animationController, curve: Curves.ease);
    // animationOffset =
    //     Tween<Offset>(begin: Offset.zero, end: const Offset(0, -0.2))
    //         .animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.animationOffset,
      child: widget.child,
    );
  }
}
