Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09C331ED71
	for <linux-coco@lists.linux.dev>; Wed, 19 Nov 2025 22:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763592305; cv=none; b=NjiodPGzOIvCtBs64cJQMO9NvPWVjpAoMPYgY/Kf/15CoMkTA2Xqwbeudy9i4hm7tLKgpvSB91vCIEBu4KjBBMQ4JhLrLVGfTOkmhAeXExqLDgRQ/fvqA5UtnK8CF09v+ZnBUNthbuGYYPlgprk6brj7cfld1wa71r0W71KetBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763592305; c=relaxed/simple;
	bh=YCsCADYFDlUMMry3ZvtZ3a7vfgBowu27srxVBqDai48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bk+nwk4bjx5NYZ0cYGMFmDXEv5ogBqYGv9WEmP5/SxjsCQim+a1YhbbAVACiX9yB2k5d2VATj75gV6FLyvak6POUm9nH4ldAvi4m5OS506BykhETt2tYxyMElsmww1vxHwE0EZFdWn3uhzUAPlf9XdJQAuw3zGLo6lrDCgpyTuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KFwSBXH5; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KFwSBXH5"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4edb8d6e98aso122981cf.0
        for <linux-coco@lists.linux.dev>; Wed, 19 Nov 2025 14:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763592302; x=1764197102; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBneZFVzxGCq6LaEXI27LUC65i3dguvTraw1DqCJir8=;
        b=KFwSBXH5LV9cJ9Hq2p3nlwv9Ie2bin+xKz/IGA80LDuw4jeTewrbXPlnTZiVHwRt2J
         Bz6+Hi9zIHAcaehUxWSwpubOfwhysYPyLbN2CRbYzGRgz1ZD+vfnUzxqKnHdsYaPQ7kt
         vWHc+9iJgrtQYOvcj4t5cfn69+4fPUz9E2zeAxpoiYU5vxkeJdpw+uHxFyb4a+We6Tek
         9tSsj3eJtHqjSopV9XNpLlqPdcBcsUva2QkR75NG5ajSobUdI70eXTIx48Ak8Ff0pFR5
         eC8BydOfAvGi2X75dvlwBgexHo9i4gCGp8hbcWh0tOrLLkSd+CS0m9sVrWyCJr6ebnok
         /Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763592302; x=1764197102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aBneZFVzxGCq6LaEXI27LUC65i3dguvTraw1DqCJir8=;
        b=pXQu3P3Fc4MidndJ3xT8hZhovc2GVM/4/PHQ+swpCaOp6is5jHW/LL86gaxfNkSsdr
         cM1UxWDtYmiV997Az7/3SfGGtHjrXwuFHJT2YXvGmh2iBbzxRyjPvgkqE+/Z9TjXaeop
         ELOWzo7IODeHB7TAasWEiEiXO+fedty1YA300+jKSwJn6uYDlvbxbbkx1z2SAzg7QYPP
         e5Lg/qzGTv3y1kP9dbMfi4cEslRAsL9ew7ibq4eUwwrstDWXqSgpaGRFJ/FPmkO7Ho8Q
         RQ2ZixHdN8WqZvCiVouDsU7g4OizkHVTtV1nTcG8bVjqvecoB9ondm57LGPH62e0rK0x
         reFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2ApKQHeFPN7yL/3hN8GYfTBiZx31yUigDGJFAQW2s/x9zgnm6Gty7nUyB1v/F6jn2XCapE8ejhbUD@lists.linux.dev
X-Gm-Message-State: AOJu0YxZHwDdQHD9P7EriROFCfQfD17Z5ukxwphbIWyoDoz8+gzkmoix
	rrZwy50ghSlRmaaG4gyRJ/JAknTTKnMAmoldGRyxDBIrq0y4tCMY2VeMUYHflKmyWxZRPUQ0mnN
	5I09gxQp9s8rr+3xXbZeXSKJ9KGVMycle/3nFAe4x
X-Gm-Gg: ASbGncvwptm/H0hxPlcixIZF/su6dfTIP6j1H7afurl0BiZnWdeunUHtCHo+PsF1iGH
	2nXhQCzSvmcM3eb/lzVtK3FkmN3rzw1K71X84sEtgo8AJ4AoK9Vy2VS3NIBfJmxOPzhZkNCCj5a
	pu2MwZiXHjjEk+0yI/P1hnKYZXeimfunStXPPimVMJkarqkc0v9KE+mJMxCdUyX2RPnfbn/vxAo
	rnFnnU/R6sHpkTpeMiSTPdsJz3c+mkNAKvb1rEgZ+NGjW/6No8U4XzpYL1PgzSoFLbmlCFh6deI
	7AMbJ0yZJTw6QW6+rKwUC0p7n1Ta
X-Google-Smtp-Source: AGHT+IFdSeMh71H0qzdKKpQsocwiMyL0lEsN6Jql+hnOrph7rWiAqaspy9lu2WqxGnAI8C4Ej2eWwHp8EWOCXWBXrfw=
X-Received: by 2002:a05:622a:1821:b0:4ed:a65c:88d0 with SMTP id
 d75a77b69052e-4ee49b1007dmr1740381cf.6.1763592302282; Wed, 19 Nov 2025
 14:45:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <68fe92d8eef5f_10e210057@dwillia2-mobl4.notmuch>
 <CAGtprH8g5212M26HPneyaHPq8VKS=x4TU4Q4vbDZqt_gYLO=TA@mail.gmail.com>
 <68ffbfb53f8b5_10e210078@dwillia2-mobl4.notmuch> <CAGtprH-rv9T1ano+ti=3eU4FO2APCOcR06buPALggAwUnka3Dg@mail.gmail.com>
 <690026ac52509_10e2100cd@dwillia2-mobl4.notmuch> <CAAYXXYyVC0Sm+1PBw=xoYNDV7aa54c_6KTGjMdwVaBAJOd8Hpw@mail.gmail.com>
 <aQFmOZCdw64z14cJ@google.com> <6901792e39d13_10e9100ed@dwillia2-mobl4.notmuch>
 <aQIbM5m09G0FYTzE@google.com> <CAGtprH_oR44Vx9Z0cfxvq5-QbyLmy_+Gn3tWm3wzHPmC1nC0eg@mail.gmail.com>
 <aQQkrx2hXkPdcifr@intel.com>
In-Reply-To: <aQQkrx2hXkPdcifr@intel.com>
From: Sagi Shahar <sagis@google.com>
Date: Wed, 19 Nov 2025 16:44:50 -0600
X-Gm-Features: AWmQ_bmuGMI4YDB4mmzBtDvuyFEevjMwhfNwtRhQDxPPt4YuyMa8s5N8kufLRgM
Message-ID: <CAAhR5DE=Y_uU1N6NczvZ9AJ0C7K_KNU-9Y4bBcQLkoXUDkp9kg@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: Chao Gao <chao.gao@intel.com>
Cc: Vishal Annapurve <vannapurve@google.com>, Sean Christopherson <seanjc@google.com>, dan.j.williams@intel.com, 
	Erdem Aktas <erdemaktas@google.com>, Dave Hansen <dave.hansen@intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	Reinette Chatre <reinette.chatre@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, 
	"paulmck@kernel.org" <paulmck@kernel.org>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 9:53=E2=80=AFPM Chao Gao <chao.gao@intel.com> wrote=
:
>
> >A reference patch we tested for "Avoid updates during update-sensitive
> >times" and one caveat was that
> >/sys/devices/virtual/tdx/tdx_tsm/version was not available post update
> >failure until a subsequent successful update:
>
> I also tested this. It works well to prevent updates during TD build, so,
>
>   Tested-by: Chao Gao <chao.gao@intel.com>
>
> And I can integrate this change into my next version if you don't object.
>
> Regarding the caveat, could you check if the diff [*] I posted earlier th=
is
> week can fix it?
>
> [1]: https://lore.kernel.org/linux-coco/aQAwRrvYMcaMsu02@intel.com/

[Now in plaintext]

I tried testing it with the 1.5.24 TDX module and it sometimes fails,
but the failure does not appear consistent.

I added a local change to add the
TDX_SYS_SHUTDOWN_AVOID_COMPAT_SENSITIVE flag when calling
TDH_SYS_SHUTDOWN and TDH_SYS_SHUTDOWN fails as expected if a VM is
under build:
[ 1224.571177] virt/tdx: SEAMCALL (52) failed: 0x8000051200010000

But then sometimes trying to finalize the VM fail with the following error:
[ 1230.915145] kvm_intel: SEAMCALL TDH_MR_FINALIZE failed: 0x8000ff00ffff00=
00
[ 1230.948264] kvm_intel: tdh_mng_vpflushdone() failed. HKID 3 is leaked.

At this point the module seems to be in a broken state and trying to
create more TDs will fail:
[ 1543.745606] kvm_intel: SEAMCALL TDH_MNG_CREATE failed: 0x8000ff00ffff000=
0

Trying to update the module will fail shutdown with -ENODEV
