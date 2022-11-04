package com.info.filmleruygulamasi;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    private Toolbar toolbar;
    private RecyclerView kategoriRv;
    private ArrayList<Kategoriler> kategorilerArrayList;
    private KategoriAdapter adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        toolbar = findViewById(R.id.toolbar);
        kategoriRv = findViewById(R.id.kategoriRv);

        toolbar.setTitle("Kategoriler");
        setSupportActionBar(toolbar);

        kategoriRv.setHasFixedSize(true);
        kategoriRv.setLayoutManager(new LinearLayoutManager(this));

        tumKategoriler();

    }


    public void tumKategoriler(){

        String url = "http://kasimadalan.pe.hu/filmler/tum_kategoriler.php";

        StringRequest stringRequest = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                kategorilerArrayList= new ArrayList<>();

                try {
                    JSONObject jsonObject = new JSONObject(response);

                    JSONArray kategoriler = jsonObject.getJSONArray("kategoriler");

                    for(int i = 0;i<kategoriler.length();i++){
                        JSONObject k = kategoriler.getJSONObject(i);

                        int kategori_id= k.getInt("kategori_id");
                        String kategori_ad = k.getString("kategori_ad");

                        Kategoriler kategori = new Kategoriler(kategori_id,kategori_ad);

                        kategorilerArrayList.add(kategori);

                    }


                    adapter = new KategoriAdapter(MainActivity.this,kategorilerArrayList);

                    kategoriRv.setAdapter(adapter);

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
