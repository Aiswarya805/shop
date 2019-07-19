package com.example.login;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
     private EditText NAME;
     private EditText  PASSWORD;
    private Button LOGIN;
    private  TextView info;
    private int counter=5;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        NAME = (EditText) findViewById(R.id.NAME);
        PASSWORD =(EditText) findViewById(R.id.PASSWORD);
        LOGIN=(Button)findViewById(R.id.LOGIN);
        info=(TextView)findViewById(R.id.info);

        info.setText("no of attempts remaming: 5");
         LOGIN.setOnClickListener(new View.OnClickListener() {
             @Override
             public void onClick(View view) {
                 validate(NAME.getText().toString(),PASSWORD.getText().toString());
             }
         });

        }


   private void validate(String username, String userpassword){
        if((username=="ABC")&&(userpassword =="1234"))
        {
            Intent intent = new Intent(MainActivity.this,SecondActivity.class);
            startActivity(intent);

        }else{
            counter--;
            info.setText("no of attempts remaining:" +String.valueOf(counter));
               if(counter == 0){
                LOGIN.setEnabled(false);
            }
        }

    }
}
package com.example.myfirebase;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.google.firebase.FirebaseApp;

    public class MainActivity extends AppCompatActivity {
        private Button button;
        private Firebase eref;
        private EditText key;
        private EditText value;
   
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            Firebase.setAndroidContext(this);
            setContentView(R.layout.activity_main);
            eref  = new Firebase("https://my-firebase-9a511.firebaseio.com/");
            key=(EditText)findViewById(R.id.key);
             value=(EditText)findViewById(R.id.value);
             b=(EditText)findViewById(R.id.b);
            button = (Button)findViewById(R.id.button);
            button.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                String Value=value.getText().toString();
                String key=key.getText().toString();
            
                    Firebase erefChild= eref.child(key);
                    erefChild.push().setValue(value);
                }
            });
        }
        
        package in.tvac.aiswarya805.firelearn;
        
        import...
        
        public class MainActivity extends AppCompatActivity {
        
        private Listview shopid;
        
         @Override
        protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
         shopid=(ListView)findViewById(R.id.ListView);
         DataBaseReference databaseReference= firebaseDatabase.getInstance().getReferenceFromUrl("https://firelearn-9a511.firebaseio.com/");
         FirebaseListAdapter<String> firebaseListAdapter = new FirebaseListAdapter<String> (
         this,
         String.class,
         android.R.layout.simple_List_shop1,
         databaseReference
         ){
         
         @Override
         protected void populateView(View v,String m,int position){
         
         TextView textview = (Textview) v.findviewById(android.R.id.text1);
         
         
         
         }
         
       };
       
       shopid.setAdapter(firebaseListAdapter);
       
     }
  }
  package com.example.myfirebase;
  
     import...

   public class MainActivity extends AppCompatActivity {
    private static final String  TAG = "MYTAG";
    private Button Submit,ReadData;
    private TextView OutputText;
    
    private FirebaseDatabase nData;
    private DatabaseReference nref;
    
    @Override
        protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        initViews();
        nData = FirebaseDatabase.getInstance();
        nref = nData.getRefernce(path: "users");
        
        this.Submit.setOnClickListener(this::runCode);
        this.ReadData.setOnClickListener(this::readData);
        
        }
        private void readData(View view){
        nref.addChildEventListener( new ChildEventListener() {
        @Override
        public void onChildAdded(@NonNull DataSnapshot dataSnapshot,@NonNull String s){
        Map<String,Object> data= (Map<STring>,Object) dataSnapshot.getValue();
        
        Log.d(TAG, msg: "onChildAdded: Name: "+data.get("Name"));
        
        }
         @Override
        public void onChildChanged(@NonNull DataSnapshot dataSnapshot,@NonNull String s){
          Log.d(TAG,msg:"onChildChanged: called");
          
          Map<String,Object> data= (Map<STring>,Object) dataSnapshot.getValue();
          
           Log.d(TAG, msg: "onChildAdded: Name: "+data.get("Name"));
       }
       
         @Override
        public void onChildRemoved(@NonNull DataSnapshot dataSnapshot){
        
        }
        
         @Override
        public void onChildMoved(@NonNull DataSnapshot dataSnapshot,@NonNull String s){
        
        }
        
         @Override
        public void onCancelled(@NonNull DatabaseError databaseError){
        
        }
       });
      }
      
      private void runcode(View view){
      // insert data here
      
      String data= InputText.getText().toString();
      String key=nref.push().getKey();
      nref.child(key).child("Name").setValue(data);
      
      }
      
      private void initView() {...}
    }
    
      package com.example.loginfirebase;
  
     import...

   public class MainActivity extends AppCompatActivity {
   
   ListView iv;
   FirebaseListAdapter adapter;
    @Override
        protected void onCreate(Bundle savedInstanceState) {
         super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        iv = (ListView) findViewById(R.id.listview);
        Query query = FirebaseDatabase.getInstance().getReference().child("Shops");
        FirebaseListOptions<Shops> options = new firebaseListOptions.Builder<student>
                        .setLayout(R.layout.shops).setQuery(query,shops.class).build());
        adapter = new firebaseListAdapter(options) {
        @Override
        protected void populateView(view v,Object mode, int position) {
         TextView shopid = v.findViewbyId(R.id.shopid);
         TextView name = v.findViewbyId(R.id.name);
         
         Shops shops = (Shops) mode;
         shopid.setText("ID: " +shops.getShopsid().toString());
         name.setText("NAME: " +shops.getName().toString());
        }
      };
      iv.setAdapter(adapter);
      } 
      
     @Override
     protected void onstart()  {
     super.onStart();
     adapter.startListening();
     }
     
     @Override
     protected void onStop()  {
     super.onStop();
     adapter.stopListening();
     }

    package com.example.loginfirebase;
  
     import...

   public class MainActivity extends AppCompatActivity {
   
   ListView iv;
   FirebaseListAdapter adapter;
    @Override
        protected void onCreate(Bundle savedInstanceState) {
         super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        iv = (ListView) findViewById(R.id.listview);
        Query query = FirebaseDatabase.getInstance(0.getReference().child("Shops");
        FirebaseListOptions<Shops> options = new firebaseListOptions.Builder<student>
                        .setLayout(R.layout.shops).setQuery(query,shops.class).build());
        adapter = new firebaseListAdapter(options) {
        @Override
        protected void populateView(view v,Object mode, int position) {
         TextView shopid = v.findViewbyId(R.id.shopid);
         TextView name = v.findViewbyId(R.id.name);
         
         Shops shops = (Shops) mode;
         shopid.setText("ID: " +shops.getShopsid().toString());
         name.setText("NAME: " +shops.getName().toString());
        }
      };
      iv.setAdapter(adapter);
      iv.setOnItemClickListener(new Adapterview.OnItemClickListener()   {
      @Override
      public void onItemclick(Adapterview<?> adapterView, View view,int i ,long l)  {
      Intent UpateDelete =  new Intent ( packageContext: start.this,updateDelete.class);
      Shops shops = (Shops) adapterView.getItemAtposition(i);
      UpdateDelete.putExtra(name: "shopid",s.getShopid());
      UpdateDelete.putExtra(name: "name",s.getName());
      UpdateDelete.putExtra(name: "key",s.getShops());


    startActivity(updateDelete);
 }

    package com.example.loginfirebase;
  
     import...

   public class updateDelete  extends AppCompatActivity {
   EditText shopid,name; 
   TextView key1;
   DatabaseReference nref;
         @Override
        protected void onCreate(Bundle savedInstanceState) {
         super.onCreate(savedInstanceState);
         setContentView(R.layout.activity_main);
        shopid = (EditText) findViewById (R.id.shopid);
        name = (EditText) findViewById (R.id.name);
        String key=getIntent().getExtras().get("key").toString();
        nref=FirebaseDatabase.getInstance().getReferences().child("Shops").child(key);

       key1 = (TextView) findViewById(R.id.key);  key1.setText(key);
       shopid.setText(getIntent().getStringExtra(name: "shopid"));
       name.setText(getIntent().getStringExtra(name: "name")); 

    }
      public void Update_Click(View view) {
        nref.addlistenerForsingleValueEvent( new ValueEventListener ()  {
     @Override
     public void onDataChange(DataSnapshot dataSnapshot) {
     dataSnapshot.getnref().child("shopid").setValue(shopid.getText().toString());
     dataSnapshot.getnref().child("name").setValue(name.getText().toString());
     Toast.makeText(context:updateDelete.this,text:"Data updated Successfully",Toast.LENGTH_LONG).show();
     updateDelete.this.finish();
  }
   @Override
   public void onCancelled(DatabaseError databaseError) {

  }
});
    public void Delete_Click(View view) {
    nref.removeValue().addOnCompleteListener(new OnCompleteListener<Void>) () {
    @Override
    public void onComplete(@NonNull Task<Void> task) {
    if(ask.isSucessful())
    {
      Toast.makeText(context:updateDelete.this,text:"Deleted sucessfully",Toast.LENGTH_LONG).show();
       updateDelete.this.finish();
    }else {
       Toast.makeText(context:updateDelete.this,text:" Not Deleted",Toast.LENGTH_LONG).show();
     }
     
   }
 });
        
        
        
 
