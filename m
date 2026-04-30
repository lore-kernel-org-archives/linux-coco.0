Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090CE29B200
	for <linux-coco@lists.linux.dev>; Thu, 30 Apr 2026 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576827; cv=none; b=AXK6BWhyJ54mrbOq7iaD7e5RsrhI3xy4ga51wiVrZmIczdYbGdI7Bkl8FzIahCMn6PPkAWh4qzg6PSHdMfkOpXp3F68UzMz1hH0ABgHk2gNYCYJ+WhqtEc7ZR6NGxRckdh3EKWjt17A2DrdHYwclVGDvMDlZ3h9fltATpqc7g5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576827; c=relaxed/simple;
	bh=C5arWefFDNbRaIamaEMBQUvYBS9ckgNEZwVvFQkmtl0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EFdLVAjuc1H2bPiwrkJZSyBrhBPyjFFRCVNmmoPjBvK6SKG9MzqcEUQQpScmQV0R2JtGrxY9OoJriRGdzXF1LgLnqKfFbXJc+kC3ffD9WdxtpI34wvs3d1nEMmldJ5PszfR56y5LJU3wnNeVjbIA4CjOcWnUS+/PhEYOzAfD9hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aovwd/ST; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aovwd/ST"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82f504f6b75so734278b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 30 Apr 2026 12:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777576825; x=1778181625; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7nmwj/xSYnHSSTZhkQ2oMM/1dWkKXj0aCEkeTcwXSY=;
        b=aovwd/ST4185BogCLDiui3DEh733D/kw7vevtxwtdRxEwDaMW2ODXTIsr/JmaUR8ze
         Gp5Btzcgc3TrZzhlFxFlHSZ+azPFqwXaVc1h8ph9fVFezgNDV4p57wz711L7Lj7JZtFI
         mhCA/H0bN+p0rO5J/zYLKbWIye46+tDvs17E3HUxfv9eNzPH9bRmwurDKO9/4B85+eUw
         kxYyAlI6U7Zuc9DdTCUfmnzeTzlknH/sXTUtGShHUVOBL22uVsAXClbHPCz9y1CEp1cC
         b+zAnXOqJWmbzGKyk95Y/AnxSinqm47RTmlj5/zI3/xvMWgdUeJRRvvKYRoI1ZGgWyja
         RV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576825; x=1778181625;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i7nmwj/xSYnHSSTZhkQ2oMM/1dWkKXj0aCEkeTcwXSY=;
        b=HoUtQZgXTFxEzeNUpJuEM5sCTWPe9reZ3ZKcB6EQdKi47iotNTB7aYml7KSUjWowJ5
         vOfLQAUpRMYZeJmK13fi2JHSUdfRN4QT2SC3crtj4nDWAweIXLW4OJdDYv4gDAzfq0K8
         XeNXBxEB/TzvAxWCO98VGorSPIXk+ih2hpX8FeSbIgZUZOtf75lpKBCIqGcibKiEHBRi
         QTAUtW9jow0mtnHr9NtCToajPCbB6NJBh/iXX8tSreFSLvlUP8lgh5TPH3gCl19zjSvA
         kWYPEoDSg2CYQJUuKhPrUwcX3BZdlvVg74Ug27LOe5em2zNYZP/7JHUaoj3jx1SJyw0n
         IlkA==
X-Forwarded-Encrypted: i=1; AFNElJ8g/xKfgakRjrh9flrGbJIRftbhorOhRmSA7pb++LcMhr8+8XA0tthxeDif/dAUu+n5insAWKohbcLe@lists.linux.dev
X-Gm-Message-State: AOJu0YwelNZB4ZQ3VibtJI2Kq6m7xliSsp2vUyel70DuTeGEiTvIo7ON
	3drOYW9lIt0JEqn3A/evOzzlnSCX5o5nLasTr1kpMFaEmTpdNEYUv+c4WKKGSElHWOS3BzhLnYW
	2jTu8+A==
X-Received: from pfj1.prod.google.com ([2002:a05:6a00:a401:b0:82f:2a0d:b24c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:90a9:b0:834:e605:9927
 with SMTP id d2e1a72fcca58-834fdcb93b7mr4649065b3a.37.1777576825076; Thu, 30
 Apr 2026 12:20:25 -0700 (PDT)
Date: Thu, 30 Apr 2026 12:20:23 -0700
In-Reply-To: <231efd4e9267d3dbb8c63e57b3a43567c965e24a.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260430014852.24183-1-yan.y.zhao@intel.com> <20260430014948.24226-1-yan.y.zhao@intel.com>
 <CAEvNRgGsMaioFvTWaLhnDiLbdx3tunZpo3Qzxdm1xeb4ef0J9Q@mail.gmail.com> <231efd4e9267d3dbb8c63e57b3a43567c965e24a.camel@intel.com>
Message-ID: <afOrd7JYkUfe7wcZ@google.com>
Subject: Re: [PATCH v2 2/4] x86/tdx: Use PFN directly for unmapping guest
 private memory
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Sagi Shahar <sagis@google.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"kas@kernel.org" <kas@kernel.org>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kai Huang <kai.huang@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026, Rick P Edgecombe wrote:
> On Thu, 2026-04-30 at 11:17 -0700, Ackerley Tng wrote:
> > > =C2=A0 {
> > > =C2=A0=C2=A0	const void *zero_page =3D (const void *)page_address(ZER=
O_PAGE(0));
> > > =C2=A0=C2=A0	unsigned long phys, end;
> > > @@ -729,6 +729,7 @@ static void tdx_quirk_reset_paddr(unsigned long b=
ase, unsigned long size)
> > > =C2=A0=C2=A0	 */
> > > =C2=A0=C2=A0	mb();
> > > =C2=A0 }
> > > +EXPORT_SYMBOL_FOR_KVM(tdx_quirk_reset_paddr);
> > >=20
> > > =C2=A0 void tdx_quirk_reset_page(struct page *page)
> > > =C2=A0 {
> > > @@ -1920,17 +1921,17 @@ u64 tdh_phymem_page_wbinvd_tdr(struct tdx_td =
*td)
> > > =C2=A0 {
> > > =C2=A0=C2=A0	struct tdx_module_args args =3D {};
> > >=20
> > > -	args.rcx =3D mk_keyed_paddr(tdx_global_keyid, td->tdr_page);
> > > +	args.rcx =3D mk_keyed_paddr(tdx_global_keyid, page_to_pfn(td->tdr_p=
age));
> >=20
> > Should mk_keyed_paddr() be updated to have a return type of phys_addr_t=
?
> > I guess in this case since mk_keyed_paddr() is pretty much an internal
> > function, returning u64 also makes sense to indicate that it should onl=
y
> > be used to set 64 bit registers.
>=20
> Yea, this is used to construct u64 inputs for seamcall args. So I think i=
t
> should keep returning u64s.

+1.  IMO, we should treat the TDX-Module as an extension of hardware and pa=
ss in
u64s where the spec says it takes a 64-bit value.

