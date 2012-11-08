class Group {
 
 String name;
 ArrayList<Module> modules = new ArrayList();
 ArrayList<DotModule> dotModules = new ArrayList();

 Group( String _name ) {
  name = _name;
 } 
  
  void displayModules() {
   Color randC = weightedColors.getRandom();
   
   for( int i=0; i < modules.size(); i++ ) {
     Module thisModule = modules.get( i );
     thisModule.display( randC.c ); 
  }
  }
  
  void displayDotModules() {
   for( int i = 0; i < dotModules.size(); i++ ) {
     DotModule thisDotModule = dotModules.get( i );
     thisDotModule.display(); 
  }  
  }
}
