
import 'package:dashboard_relawan/bloc/list_pasien/list_data_bloc.dart';
import 'package:dashboard_relawan/bloc/list_pasien/list_data_event.dart';
import 'package:dashboard_relawan/bloc/list_pasien/list_data_state.dart';
import 'package:dashboard_relawan/repository/list_pasien/list_data_repo.dart';
import 'package:dashboard_relawan/services/list_pasien/list_data_services.dart';
import 'package:dashboard_relawan/views/input_data_pasien.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ListDataPasien extends StatelessWidget {
  const ListDataPasien({super.key, required String selectedFilter, required Null Function(dynamic String) onSearchChanged, required Null Function(dynamic String) onFilterChanged, required Null Function() onAddPatient});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (_) => ListPasienBloc(PasienRepo(PasienService()))..add(LoadPasienEvent()),
  child: const _ListDataPasienView(),
);
  }
}

class FetchPasienEvent extends ListPasienEvent {}


class _ListDataPasienView extends StatelessWidget {
  const _ListDataPasienView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text('Data Pasien', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF4169FF),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const InputDataPasienPage()),
          );
          if (result != null) {
            context.read<ListPasienBloc>().add(AddPasienEvent(result));
          }
        },
      ),
      body: Column(
        children: [
          _FilterButtons(),
          Expanded(
            child: BlocBuilder<ListPasienBloc, ListPasienState>(
              builder: (context, state) {
                if (state is ListPasienLoaded) {
                  final pasienList = state.filteredPasien;
                  if (pasienList.isEmpty) {
                    return Center(
                      child: Text('Belum ada data pasien.',
                          style: GoogleFonts.poppins(color: Colors.grey)),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: pasienList.length,
                    itemBuilder: (_, index) {
                      final pasien = pasienList[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: pasien.status == 'Positif'
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pasien.nama,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                            Text('${pasien.umur} Tahun, ${pasien.jenisKelamin}',
                                style: GoogleFonts.poppins()),
                          ],
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }
}

class _FilterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentState = context.watch<ListPasienBloc>().state;
    final selected = currentState is ListPasienLoaded ? currentState.filter : 'Semua';
    final filters = ['Semua', 'Positif', 'Negatif'];

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: filters.map((label) {
          final isSelected = selected == label;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                context.read<ListPasienBloc>().add(FilterPasienEvent(label));
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF4169FF) : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : const Color(0xFF4169FF),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
