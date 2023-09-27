import 'package:flutter/material.dart';
import 'package:learn_pagination/core/param/image_param.dart';
import 'package:learn_pagination/core/service_locator.dart';
import 'package:learn_pagination/domain/models/image/image.dart';
import 'package:learn_pagination/presentation/screens/one_page.dart';
import 'package:learn_pagination/presentation/screens/upload_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CatImage> images = [];
  int selectedpage= 0;

  final ScrollController controller = ScrollController();
  late final  PageController control = PageController();
  int exitCounter = 0;
  int page = 0;
  int limit = 20;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getAllImage();
    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent &&
          ((page + 1) * limit) == images.length) {
        getAllImage(page: ++page);
      }

    });
  }

  void getAllImage({int page = 0}) async {
    setState(() => isLoading = true);
    images.addAll(await repository
        .fetchAllCatImage(ImageParam(limit: limit, page: page)));
    setState(() => isLoading = false);
  }


   void goUploadPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const UploadScreen() ));
    getAllImage();
   }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Cat App"),
        backgroundColor: Colors.white.withOpacity(.30),
       shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
       ),
      ),
      body: PageView(
        onPageChanged: (value) {
           onchange(value);
           setState(() {});
        },
        children: [
            OnePage(controller: controller,images: images,isLoading: isLoading,),
            
        OnePage(controller: controller,images: images,isLoading: isLoading,),
        ],
         ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
         floatingActionButton: FloatingActionButton(
          onPressed:goUploadPage,
          shape: const CircleBorder(),
          elevation: 10,
          backgroundColor: Colors.white.withOpacity(.20),
          child: const Icon(Icons.add_box_outlined,color: Colors.black,), ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))
        ),
        child: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          notchMargin: 10,
          color:Colors.white.withOpacity(.20) ,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.home,color: Colors.black, size: 40,)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.account_box_outlined,color: Colors.black,size: 40,))
              ],
            ),
          ),
        ),
        
      ),
      extendBody: true,
    );
  


  }
void onchange(int index){
  selectedpage= index;
  setState(() {
    
  });
}
  
}
