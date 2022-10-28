package com.info.notuygulamasi;

import android.content.Intent;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;


public class DetayActivity extends AppCompatActivity {
    private Toolbar toolbar;
    private EditText editTextDers,editTextNot1,editTextNot2;
    private Notlar not;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detay);

        toolbar = findViewById(R.id.toolbar);
        editTextDers = findViewById(R.id.editTextDers);
        editTextNot1 = findViewById(R.id.editTextNot1);
        editTextNot2 = findViewById(R.id.editTextNot2);

        toolbar.setTitle("Not Detay");
        setSupportActionBar(toolbar);

        not = (Notlar) getIntent().getSerializableExtra("nesne");

        editTextDers.setText(not.getDers_adi());
        editTextNot1.setText(String.valueOf(not.getNot1()));
        editTextNot2.setText(String.valueOf(not.getNot2()));

    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {

        getMenuInflater().inflate(R.menu.toolbar_menu,menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        switch (item.getItemId()){
            case R.id.action_sil:
                Snackbar.make(toolbar,"Silinsin mi ?",Snackbar.LENGTH_SHORT)
                        .setAction("Evet", new View.OnClickListener() {
                            @Override
                            public void onClick(View view) {

                                String url = "http://kasimadalan.pe.hu/notlar/delete_not.php";

                                StringRequest stringRequest = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
                                    @Override
                                    public void onResponse(String response) {

                                        Log.e("CEVAP",response);

                                    }
                                }, new Response.ErrorListener() {
                                    @Override
                                    public void onErrorResponse(VolleyError error) {

                                    }
                                }){
                                    @Override
                                    protected Map<String, String> getParams() throws AuthFailureError {
                                        Map<String, String> params = new HashMap<>();

                                        params.put("not_id",String.valueOf(not.getNot_id()));

                                        return params;
                                    }
                                };


                                Volley.newRequestQueue(DetayActivity.this).add(stringRequest);





                                startActivity(new Intent(DetayActivity.this,MainActivity.class));
                                finish();
                            }
                        })
                        .show();
                return true;
            case  R.id.action_duzenle:

                String url = "http://kasimadalan.pe.hu/notlar/update_not.php";

                StringRequest stringRequest = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        Log.e("CEVAP",response);

                    }
                }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {

                    }
                }){
                    @Override
                    protected Map<String, String> getParams() throws AuthFailureError {
                        Map<String, String> params = new HashMap<>();

                        params.put("not_id",String.valueOf(not.getNot_id()));
                        params.put("ders_adi",editTextDers.getText().toString());
                        params.put("not1",editTextNot1.getText().toString());
                        params.put("not2",editTextNot2.getText().toString());

                        return params;
                    }
                };


                Volley.newRequestQueue(DetayActivity.this).add(stringRequest);




                startActivity(new Intent(DetayActivity.this,MainActivity.class));
                finish();
                return true;
            default:
                return false;
        }
    }
}
