package com.esther.util;


	import com.google.api.client.googleapis.auth.clientlogin.ClientLogin;
	import com.google.api.client.http.HttpResponseException;
	import com.google.api.client.http.HttpTransport;
	import com.google.api.client.http.javanet.NetHttpTransport;

	import java.io.IOException;
	import java.lang.System;

	public class GaLogin {
	  public static void main(String[] args) throws IOException {
	    // HttpTransport used to send login request.
	    HttpTransport transport = new NetHttpTransport();
	    try {
	      // authenticate with ClientLogin
	      ClientLogin authenticator = new ClientLogin();
	      authenticator.transport = transport;
	      // Google service trying to access, e.g., "cl" for calendar.
	      authenticator.authTokenType = "gtrans";
	      authenticator.username = "webtask365@gmail.com";
	      authenticator.password = "qwer123!@";
	      authenticator.authenticate();
	      System.out.println("Authentication succeeded.");
	    } catch (HttpResponseException e) {
	      // Likely a "403 Forbidden" error.
	      System.err.println(e.getStatusMessage());
	      throw e;
	    }
	  }
}
