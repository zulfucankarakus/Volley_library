package com.info.notuygulamasi;

import android.content.Intent;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;


import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
    private Toolbar toolbar;
    private RecyclerView rv;
    private FloatingActionButton fab;
    private NotlarAdapter adapter;
    private ArrayList<Notlar> notlarArrayList;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        rv = findViewById(R.id.rv);
        fab = findViewById(R.id.fab);

        rv.setHasFixedSize(true);
        rv.setLayoutManager(new LinearLayoutManager(this));

        tumNotlar();

        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(MainActivity.this,NotKayitActivity.class));
            }
        });

    }


    public void tumNotlar(){
        String url = "http://kasimadalan.pe.hu/notlar/tum_notlar.php";

        StringRequest stringRequest = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                double toplam = 0 ;

                notlarArrayList = new ArrayList<>();

                try {
                    JSONObject jsonObject = new JSONObject(response);

                    JSONArray notlar = jsonObject.getJSONArray("notlar");

                    for(int i = 0;i<notlar.length();i++){
                        JSONObject n = notlar.getJSONObject(i);

                        int not_id = n.getInt("not_id");
                        String ders_adi = n.getString("ders_adi");
                        int not1 = n.getInt("not1");
                        int not2 = n.getInt("not2");

                        Notlar not = new Notlar(not_id,ders_adi,not1,not2);

                        notlarArrayList.add(not);

                        toplam = toplam +(not1+not2)/2;

                    }

                    adapter = new NotlarAdapter(MainActivity.this,notlarArrayList);
                    rv.setAdapter(adapter);

                    toolbar.setSubtitle("Ortalama : "+(toplam/notlarArrayList.size()));

                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });


        Volley.newRequestQueue(MainActivity.this).add(stringRequest);


    }

}
