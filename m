Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CD36136
	for <linux-coco@lists.linux.dev>; Wed, 12 Feb 2025 00:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739319794; cv=none; b=Xy0lS5ocNOsdbRQYANNuShDadsOlu3NIuaaAcljPXC6G2Hq4gkR/xa60d+cFdvoFPsnBZ6Tb+d6dAyBrMuBliZhDvTkd90B4v4dbkG06zHJnOmnLwUihqcNGOb/TGO2Px52cYhyzv6z529Ghmm58vjIS9SWUeYbQCfk2D9yHfOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739319794; c=relaxed/simple;
	bh=qNR6Tk+GObHhwah3Z3S1fvOkyR0+TVEpjXojg1MVygE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSLaaaXIwOvWsje3BoxKUriXWIZDGSsR4REFOxuy5FAJZHoMp932tMapOvA5a/iW4Flyt/PxVsLYJ7SSwjbfEA1Yn+84KIRmdn9GH9S2342+b1vzDimfKjh3hHYE23p8kRHp56SnzeYsbGGkRHVsypH4+Jk/XDooyiC13eb74Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TH39O2DE; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TH39O2DE"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-545092d763cso1379e87.1
        for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 16:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739319790; x=1739924590; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mACifcoi2DxXepU+x0EutTWQzaMm/Sos4wROfYi3LJM=;
        b=TH39O2DEd915JcHF2esxhoBspm8hNMjQ2D0+TO8+oJaWSuLiCduZb9pedqk9Pjy61W
         lbxBpJ033v3FrsFPgpOkfbGBBd3XCGLDDq3h8ThpRn6HgOMnRYxzW4Y8cwIfkY8t3peY
         D31icM7xdn8MAOMTlcfuBpDNNIHIWOqrKu1DZt/SEJQFrZ01TpKNpQFqSDRPdEcgmhgq
         mw+v7EjVG3aLX8a44ZBozemMIvVfY+gB3sfcs4h2EOPHYAXc8q5ldbUylEpBWfNJhj2b
         +9mIdAPzYtb/pKv7/rxdKF/OrGe2ePykev0jTPirbbJU67FherumQAmRdNCVAD+a1bhR
         V7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739319790; x=1739924590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mACifcoi2DxXepU+x0EutTWQzaMm/Sos4wROfYi3LJM=;
        b=pvXBt2dd/6GFNzDQNB33Ba6t0+XdpJMYXWBheLSWKmJvkzqXuxLDpqbzbaFPV16oXS
         R7FIr5S9Qk0c6mgF8pT7lgqEeDT94J+tlWIJ7RDAIplysQXNKIA7ikF3Sikjo9RZwZtu
         ybAPvkabimMmEHpJp6TE04VTnI4llCRyEiyUUQNGZk1ax6xZKCxHchP1eWyUIAJ1w3ez
         AIOtbEGznplI8a43Q3zEMqJhtg51fVlfkOsIaIH+5w6tKNCMDEytdMfTVJj2YoyyIrHu
         zMcT962NNBUTHSnKEmE+P/iYiwJBxtvlnxjfKANgRtwSknW1F7cY55MroP4iUE92ZQhy
         tcVw==
X-Forwarded-Encrypted: i=1; AJvYcCVeSkVRTpai2d2dCv8tgtUIuet92Et6X/oWrKdH5t23AKB7nqw4uys84tVWx1T5NC2/oamhbID97+3c@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ8van0ZWxWmbpdSZPUs1U3nk0ETA/9KaUvVus7EubjnUPVtAC
	zLx2/c8+022phSr9QRdS95FEFZVvSFpP6orD6zmQmkibGHLzmbOwiolliDfZGoWY8XCNRuaq+Gr
	TFxOBlw8SaQdW13s7IOX6M5wrfZqg3lI3+ndC
X-Gm-Gg: ASbGncvq2HI6QbOMOIO0EWBYywPO3RZiarCHjacvmRUXvtDX6W8iHlBp2f/t1sHXOkX
	Kpj/pSPsWtJrEqV0pPEm+GeMwIihU8pZCpja0WiNgyDZfNOBS2FnxHqKXwMTDZ8w4r8gCm/GNYq
	+aDY/9o+VilcOO/dWc7xcCPl4qrA8iqw==
X-Google-Smtp-Source: AGHT+IFPKhZm0/EPYURfMy8o2OglVh9zff4nbrdv9CblcFNVpZjWo90EpnyStQulFiUbZl+EMuN5argcpQNCmKAOnj4=
X-Received: by 2002:a05:6512:3d90:b0:545:34e:16c0 with SMTP id
 2adb3069b0e04-54518de9606mr49823e87.5.1739319790362; Tue, 11 Feb 2025
 16:23:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206222714.1079059-1-vannapurve@google.com>
 <wra363f7ye6mwv2papahmpgmybi45yqyzeohunbqju3zsf22td@zcutpjluiury> <c07fa2b7-d453-4a9d-b1fc-e3e96514a8d3@intel.com>
In-Reply-To: <c07fa2b7-d453-4a9d-b1fc-e3e96514a8d3@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 11 Feb 2025 16:22:59 -0800
X-Gm-Features: AWEUYZlkk-jh9FqHHuYl2log-YQTJzWr98PHa1jkE8VtQRSzVdPYb1_-7Dq2dlc
Message-ID: <CAGtprH_4Z15UdPDDCYg=pnroS41fX7c7VzK_ziPMsk=UgQYfgw@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] x86/tdx: Route safe halt execution via tdx_safe_halt()
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com, seanjc@google.com, 
	erdemaktas@google.com, ackerleytng@google.com, jxgao@google.com, 
	sagis@google.com, oupton@google.com, pgonda@google.com, kirill@shutemov.name, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 3:46=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 2/11/25 00:32, Kirill A. Shutemov wrote:
> >> If CONFIG_PARAVIRT_XXL is disabled, "sti;hlt" sequences can still get
> >> executed from TDX VMs via paths like:
> >>         acpi_safe_halt() =3D>
> >>         raw_safe_halt()  =3D>
> >>         arch_safe_halt() =3D>
> >>      native_safe_halt()
> >> There is a long term plan to fix these paths by carving out
> >> irq.safe_halt() outside paravirt framework.
> > I don't think it is acceptable to keep !PARAVIRT_XXL (read no-Xen) conf=
ig
> > broken.
>
> Oh, I thought it took PARAVIRT_XXL=3Dy to even trigger this issue. Was I
> just confused?

Original issue with unsafe "sti;hlt" execution for TDX VMs doesn't
need PARAVIRT_XXL to be enabled in theory. Any caller just needs to
reach native*halt() to trigger the issue.
