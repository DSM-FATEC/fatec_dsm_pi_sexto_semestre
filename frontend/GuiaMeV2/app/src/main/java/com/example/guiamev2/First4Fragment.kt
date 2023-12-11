package com.example.guiamev2

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.fragment.findNavController
import com.example.guiamev2.databinding.FragmentFirst4Binding

/**
 * A simple [Fragment] subclass as the default destination in the navigation.
 */
class First4Fragment : Fragment() {

private var _binding: FragmentFirst4Binding? = null
    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

      _binding = FragmentFirst4Binding.inflate(inflater, container, false)
      return binding.root

    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        binding.buttonFirst.setOnClickListener {
            findNavController().navigate(R.id.action_First4Fragment_to_Second4Fragment)
        }
    }

override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}