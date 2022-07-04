
import 'package:newsup/modles/categoryModel.dart';
List<CategoryModel> getCategories() {
  List<CategoryModel> category = List<CategoryModel>.empty(growable: true);
  CategoryModel categorymodel = CategoryModel();
  //1
  categorymodel.categoryName = 'Business';
  categorymodel.imgurl =
  "https://images.unsplash.com/photo-1523287562758-66c7fc58967f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categorymodel);

  //2
  categorymodel = CategoryModel();
  categorymodel.categoryName = 'Entertainment';
  categorymodel.imgurl =
  "https://images.unsplash.com/photo-1598899134739-24c46f58b8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=856&q=80";
  category.add(categorymodel);

  //3
  categorymodel = CategoryModel();
  categorymodel.categoryName = 'General';
  categorymodel.imgurl =
  "https://images.unsplash.com/photo-1503428593586-e225b39bddfe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categorymodel);

  //4
  categorymodel = CategoryModel();
  categorymodel.categoryName = 'Health';
  categorymodel.imgurl =
  "https://images.unsplash.com/photo-1552196563-55cd4e45efb3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=726&q=80";
  category.add(categorymodel);

  //5
  categorymodel = CategoryModel();
  categorymodel.categoryName = 'Science';
  categorymodel.imgurl =
  "https://images.unsplash.com/photo-1614935151651-0bea6508db6b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=925&q=80";
  category.add(categorymodel);

  //6
  categorymodel = CategoryModel();
  categorymodel.categoryName = 'Sports';
  categorymodel.imgurl =
  "https://images.unsplash.com/photo-1484482340112-e1e2682b4856?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80";
  category.add(categorymodel);

  //7
  categorymodel = CategoryModel();
  categorymodel.categoryName = 'Technology';
  categorymodel.imgurl =
  "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categorymodel);

  return category;
}