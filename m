Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BFF3655CD
	for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 17:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761843721; cv=none; b=WOCc5M/YIq6DdxLgYf7Y/f1h3csNGB5KmrHtAuLtGEdJ3xFNPTJij9bbMANAbxrN8jy96bwNJR9++ScMySF8bIvUGiNTNDHJS7OLvrjdMW6tzsV7YbbQdpTpfZnaHyAv/UL+iKWDWrJuH9vk6Dx6AYMLhOXUIZ/Z20LnOjl713c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761843721; c=relaxed/simple;
	bh=qpm9nedNDxz4xhTge3n3IQ5KgJG7zyt90dJXjqfDrsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9r1VIy7uerIBIBGjqx2i9gTZJYqayKD3siDkSv3DTv0TkHIvZHt3VRMQciuADKqMPpVqneWzNAEYEJi7o70uSAWWJ07qR6tqRNTbxGfqF+KOsIjrFk8q9MCk3VTCodytpevgj2BTNcRWNyNyTcNtNL5psV6WK/foNnotr8D4cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tkkfwj7j; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tkkfwj7j"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27eeafd4882so6775ad.0
        for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761843716; x=1762448516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+EDv0KdgDVuAqLBbP2rl8wFdWQKGxBBXu9U1vhd9YY=;
        b=tkkfwj7jUcJ4Zt+FhoajwZRnfDBjvhKur2qSogp5wrfMVYbpVSfOpLUeQnNEqARHs6
         HhN8jiuCzSTFt/X0R2fGFmuy6DIGwBodhDbHssoYCBbTEPCJGZdETDiqwbhHLZiLYxYG
         aTapr8rcqH3KGv+aU0Oa0tSzURICYn9Qj7HBHvPWe7NpDwcNdi4apwdZ9nx0z1BEBo+v
         amyzDDCFKV0D3GElJldEIRgAkEEjj9E1U3iJZTIMDzUVoDHsy6p0YRSWKrkYse0IvIDq
         xDRxEWJ+kRNsG+/sLIDTzr9tRdk1DMxeM54hpGcN4i2uQisFMCoT5Zwnh5Uu6tSbosQ0
         Ua7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761843716; x=1762448516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+EDv0KdgDVuAqLBbP2rl8wFdWQKGxBBXu9U1vhd9YY=;
        b=beBIa3r61CKeGrGPSIZsPku6i9/j+mUKlCG95ux7V0snH4ywx2qVz7Oo6Wk5A66qfW
         ET8xLUIxUySkZnhtpG/a5G47zMO+3x/qg2cS6XyPfsJWi7BmrvLSxDrb1u3vHjC99D2s
         wZlw+IbjmggBrbY3D4aOS/b0YUJY0AohINsbUDgJ7uModJB5dSOph6dbb+d5iSHhEBjZ
         XuSoBT90JISt0oBAp5IHaAaX+50sYBYwSTyk/CYmfI+f78R5dEaizXfCu1XLUAu0wcus
         E8+0b4gxi2HueiTndW+c9tvAVayOfFdB2QWf+jKuVk7HGllHMHUPato+8705qqT64tAe
         AC/A==
X-Forwarded-Encrypted: i=1; AJvYcCW7Kici3nVNld5Tf9UVNh2ahb6tvzyBG1BA+RHPl9AykaUAq/hY07fexqPYII/LhXOdCEjd7olZ07ko@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv9M2pBfxB6C3BHf9qC6nGENAaKMBfoIBIr1tnhQeqjCr8yhBY
	G9pyStSKF0DMn83vXxAqIdyZfZovZHKHOWZRu1umKMKojHHgG9K4UciGNKTxb//WKDHKiKMG9ao
	sfnicncyO+YakzIpdUHgKKjTZ5CXT0KB3fnMfcdjJ
X-Gm-Gg: ASbGncvQHRniEFtqZMwhDBvvR5QmN9kkQQVf++jP//HGfufZOVMmewWi1GA1oe+2F2t
	lgvSbaF6QAhY9huBvSk1j1wnG3BxDY7RHC/S05oGfAudaZaiqu4O9J+91BWCCLSfiD19Ob6SaBR
	BC/yMBinG+3+i7VTevJPVpp5cucAP1ON9ZBdiUkBW4oL69f5eTo+CJ4mlPUu3IE/hDsMZ5Nzf8w
	S/npvWGBIi3f8dfKygeXi9WPQdjtKI18UWDkFjjvBKKcKN3RuCCl4W60+tvK+uFkdg2sefsJAA4
	gD3yIP6BE8wAgEmF0z56XqET3oIgBzB1EfL7IAo=
X-Google-Smtp-Source: AGHT+IE4OqQ/W6hJWfcB2dN7mxyOsfraIhSzr9lSBisqAXwrkaVgZsawMssYkny+eOU3PNG5tkaqyCvR01t7WahaQ/c=
X-Received: by 2002:a17:902:d50e:b0:294:e585:1f39 with SMTP id
 d9443c01a7336-294ee3c1c62mr6090225ad.14.1761843714039; Thu, 30 Oct 2025
 10:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <68fc2af6305be_10e210029@dwillia2-mobl4.notmuch>
 <CAGtprH8-UGFkh4NmuY1ETPYmg7Uk+bm24Er2PPxf8tUOSR_byQ@mail.gmail.com>
 <68fe92d8eef5f_10e210057@dwillia2-mobl4.notmuch> <CAGtprH8g5212M26HPneyaHPq8VKS=x4TU4Q4vbDZqt_gYLO=TA@mail.gmail.com>
 <68ffbfb53f8b5_10e210078@dwillia2-mobl4.notmuch> <CAGtprH-rv9T1ano+ti=3eU4FO2APCOcR06buPALggAwUnka3Dg@mail.gmail.com>
 <690026ac52509_10e2100cd@dwillia2-mobl4.notmuch> <CAAYXXYyVC0Sm+1PBw=xoYNDV7aa54c_6KTGjMdwVaBAJOd8Hpw@mail.gmail.com>
 <aQFmOZCdw64z14cJ@google.com> <6901792e39d13_10e9100ed@dwillia2-mobl4.notmuch>
 <aQIbM5m09G0FYTzE@google.com>
In-Reply-To: <aQIbM5m09G0FYTzE@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Thu, 30 Oct 2025 10:01:41 -0700
X-Gm-Features: AWmQ_bk8e0F5YzgwVWMiaGYCsgnYeJ1vHVGZjF4GsM1pPXtd3P-0mcJulnC-JVo
Message-ID: <CAGtprH_oR44Vx9Z0cfxvq5-QbyLmy_+Gn3tWm3wzHPmC1nC0eg@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: Sean Christopherson <seanjc@google.com>
Cc: dan.j.williams@intel.com, Erdem Aktas <erdemaktas@google.com>, 
	Dave Hansen <dave.hansen@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	Reinette Chatre <reinette.chatre@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, 
	"sagis@google.com" <sagis@google.com>, "paulmck@kernel.org" <paulmck@kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 6:48=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Tue, Oct 28, 2025, dan.j.williams@intel.com wrote:
> > Sean Christopherson wrote:
> > [..]
> > > > IMO, It is something userspace should decide, kernel's job is to
> > > > provide the necessary interface about it.
> > >
> > > I disagree, I don't think userspace should even get the option.  IMO,=
 not setting
> > > AVOID_COMPAT_SENSITIVE is all kinds of crazy.
> >
> > Do see Table 4.4: "Comparison of Update Incompatibility Detection and/o=
r
> > Avoidance Methods" from the latest base architecture specification [1].
> > It lists out the pros and cons of not setting AVOID_COMPAT_SENSITIVE.
> > This thread has only argued the merits of "None" and "Avoid updates
> > during update- sensitive times". It has not discussed "Detect
> > incompatibility after update", but let us not do that.
>
> But we already are discussing that, because the "None" option is just pun=
ting
> "Detect incompatibility after update" to something other than the VMM.  D=
oing
> literally nothing isn't an option.  The fact that it's even listed in the=
 table,
> not to mention has "Simplest." listed as a pro, makes me question whether=
 or not
> the authors actually understand how software built around the TDX-Module =
is used
> in practice.
>
> If an update causes a TD build to fail, or to generate the wrong measurem=
ent, or
> whatever "Failures due to incompatibilities" means, *something* eventuall=
y needs
> to take action.  Doing nothing is certainly the simplest option for the h=
ypervisor
> and VMM, but when looking at the entire stack/ecosystem, it's the most co=
mplex
> option as it bleeds the damage into multiple, potentially-unknown compone=
nts of
> the stack.  Either that, or I'm grossly misunderstanding what "Failures" =
means.
>
> That section also states:
>
>   Future TDX Module versions may have different or additional update-sens=
itive cases.
>
> Which means that from an ABI perspective, "Avoid updates during update-se=
nsitive
> times" is the _ONLY_ viable option.  My read of that is that future TDX-M=
odules
> can effectively change the failure modes for a existing KVM ioctls.  That=
 is an
> ABI change and will break userspace, e.g. if userspace is sane and expect=
s certain
> operations to succeed.

A reference patch we tested for "Avoid updates during update-sensitive
times" and one caveat was that
/sys/devices/virtual/tdx/tdx_tsm/version was not available post update
failure until a subsequent successful update:

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index e00650b83f08..96ae7c679e4e 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -22,6 +22,7 @@
 #define TDX_FEATURES0_NO_RBP_MOD               BIT_ULL(18)
 #define TDX_FEATURES0_CLFLUSH_BEFORE_ALLOC     BIT_ULL(23)
 #define TDX_FEATURES0_DYNAMIC_PAMT             BIT_ULL(36)
+#define TDX_FEATURES0_UPDATE_COMPATIBILITY     BIT_ULL(47)

 #ifndef __ASSEMBLY__

@@ -129,6 +130,11 @@ static inline bool
tdx_supports_dynamic_pamt(const struct tdx_sys_info *sysinfo)
        return sysinfo->features.tdx_features0 & TDX_FEATURES0_DYNAMIC_PAMT=
;
 }

+static inline bool tdx_supports_update_compatibility(const struct
tdx_sys_info *sysinfo)
+{
+       return sysinfo->features.tdx_features0 &
TDX_FEATURES0_UPDATE_COMPATIBILITY;
+}
+
 int tdx_guest_keyid_alloc(void);
 u32 tdx_get_nr_guest_keyids(void);
 void tdx_guest_keyid_free(unsigned int keyid);
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index f6199f8ce411..95deb1146a79 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1523,6 +1523,10 @@ int tdx_module_shutdown(void)
         * fail.
         */
        args.rcx =3D tdx_sysinfo.handoff.module_hv;
+
+       if (tdx_supports_update_compatibility(&tdx_sysinfo))
+               args.rcx |=3D TDX_SYS_SHUTDOWN_AVOID_COMPAT_SENSITIVE;
+
        ret =3D seamcall_prerr(TDH_SYS_SHUTDOWN, &args);
        if (!ret)
                tdx_module_reset_state();
diff --git a/arch/x86/virt/vmx/tdx/tdx.h b/arch/x86/virt/vmx/tdx/tdx.h
index 0cd9140620f9..772c714de2bc 100644
--- a/arch/x86/virt/vmx/tdx/tdx.h
+++ b/arch/x86/virt/vmx/tdx/tdx.h
@@ -94,6 +94,8 @@ struct tdmr_info {
 /* Bit definitions of TDX_FEATURES0 metadata field */
 #define TDX_FEATURES0_TD_PRESERVING    BIT(1)

+#define TDX_SYS_SHUTDOWN_AVOID_COMPAT_SENSITIVE                BIT(16)
+
 /*
  * Do not put any hardware-defined TDX structure representations below
  * this comment!
