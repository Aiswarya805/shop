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

     
  

