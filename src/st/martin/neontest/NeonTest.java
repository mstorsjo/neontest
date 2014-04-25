package st.martin.neontest;

import android.app.Activity;
import android.os.Bundle;

public class NeonTest extends Activity {
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);

		System.loadLibrary("neontest");
		doMain();
	}

	public static native void doMain();
}
