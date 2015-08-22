package com.sornyei.service.beallitas.szamlatukor;

import com.sornyei.model.FokSzamla;

import java.util.List;

/**
 * Created by gaborsornyei on 11/08/15.
 */
public interface SzamlatukorService {
	List<FokSzamla> findAll();

	FokSzamla findByFokSzam(String fokszam);

	FokSzamla update(FokSzamla fokSzamla);
}
