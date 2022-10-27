package com.info.sozlukuygulamasi;

import android.support.v4.view.MenuItemCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.SearchView;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public class MainActivity extends AppCompatActivity implements SearchView.OnQueryTextListener {
    private Toolbar toolbar;
    private RecyclerView rv;
    private ArrayList<Kelimeler> kelimelerListe;
    private KelimelerAdapter adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        toolbar = findViewById(R.id.toolbar);
        rv = findViewById(R.id.rv);
        toolbar.setTitle("Sözlük Uygulaması");
        setSupportActionBar(toolbar);

        rv.setHasFixedSize(true);
        rv.setLayoutManager(new LinearLayoutManager(this));

        tumKelimeler();

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {

        getMenuInflater().inflate(R.menu.toolbar_menu,menu);

        MenuItem item = menu.findItem(R.id.action_ara);
        SearchView searchView = (SearchView) MenuItemCompat.getActionView(item);
        searchView.setOnQueryTextListener(this);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onQueryTextSubmit(String query) {
        Log.e("Gönderilen arama",query);
        return false;
    }

    @Override
    public boolean onQueryTextChange(String newText) {
        Log.e("Harf girdikçe",newText);
        kelimeAra(newText);
        return false;
    }


    public void tumKelimeler(){

        String url = "http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php";

        StringRequest stringRequest = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                kelimelerListe = new ArrayList<>();

                try {
                    JSONObject jsonObj = new JSONObject(response);


                    JSONArray kelimeler = jsonObj.getJSONArray("kelimeler");

                    // looping through All Contacts
                    for (int i = 0; i < kelimeler.length(); i++) {
                        JSONObject k = kelimeler.getJSONObject(i);

                        int kelime_id = k.getInt("kelime_id");
                        String ingilizce = k.getString("ingilizce");
                        String turkce = k.getString("turkce");

                        Kelimeler kelime = new Kelimeler(kelime_id,ingilizce,turkce);

                        kelimelerListe.add(kelime);
                    }

                    adapter = new KelimelerAdapter(MainActivity.this,kelimelerListe);

                    rv.setAdapter(adapter);


                } catch (JSONException e) {


                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });

        Volley.newRequestQueue(MainActivity.this).add(stringRequest);

    }

    public void kelimeAra(final String aramaKelime){

        String url = "http://kasimadalan.pe.hu/sozluk/kelime_ara.php";

        StringRequest stringRequest = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                kelimelerListe = new ArrayList<>();

                try {
                    JSONObject jsonObj = new JSONObject(response);


                    JSONArray kelimeler = jsonObj.getJSONArray("kelimeler");

                    // looping through All Contacts
                    for (int i = 0; i < kelimeler.length(); i++) {
                        JSONObject k = kelimeler.getJSONObject(i);

                        int kelime_id = k.getInt("kelime_id");
                        String ingilizce = k.getString("ingilizce");
                        String turkce = k.getString("turkce");

                        Kelimeler kelime = new Kelimeler(kelime_id,ingilizce,turkce);

                        kelimelerListe.add(kelime);
                    }

                    adapter = new KelimelerAdapter(MainActivity.this,kelimelerListe);

                    rv.setAdapter(adapter);


                } catch (JSONException e) {


                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {

                Map<String, String> params = new HashMap<>();

                params.put("ingilizce",aramaKelime);

                return params;
            }
        };

        Volley.newRequestQueue(MainActivity.this).add(stringRequest);

    }



}
