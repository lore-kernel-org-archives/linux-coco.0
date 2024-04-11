Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A084613CAA1
	for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 06:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712816651; cv=none; b=r+1CAuOZy8TosZrfjQFQWIdEViA9gX9X4YQgpwnCgFOk+ubR0lX9h0b9h0PUWdP3Qe4qpUdyBIJgKprDmcjRsHd4ns3x9Fmk/oCYlbt8ckNtI4+WPXGYs27sZ5m8cIRGu6fp3z6kQKxBZiTUYyYWsv7txZBg/0XNLNuQkJAWr58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712816651; c=relaxed/simple;
	bh=39Yd71BvPDvFavN/Z5QN9et3+y8Ad/uGmokVERSjIWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbbzpTHdaWZ3rqZ4WDoozcox7ve++mlTZlZV/XqeA0zFQiOx9tUIIBsJp1HITFiMi2nNjkLG/uJhWuAOGFnGZevbeeVe3ltQGRmdHIW2ueyFw3txIj1ac27g3P0FYPzRESX1/WTOr8Lr4OyyrtbQQGUoGRy9KT+RjssT/ShCl3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VVEIrSpP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VVEIrSpP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41641a889ccso42425e9.1
        for <linux-coco@lists.linux.dev>; Wed, 10 Apr 2024 23:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712816648; x=1713421448; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39Yd71BvPDvFavN/Z5QN9et3+y8Ad/uGmokVERSjIWY=;
        b=VVEIrSpP4BJqX/f590eo2T6dZBekgAqd4DMWjmHxCjB5TMkZqSiOhyLL8uRA3JbnfG
         qGDylYpXDUU39KuN3wgPNwDWuODdopSu4D7afoAj4cfv+Jf/EM/Qx3IrKKTRHFU6yToZ
         m6svD5bhG0TJBPzgytF3wwvwdssUciYz1TqGKQg9GkGLfLQQdWFwyIRY6Vw3iwpNLINs
         MSZE8ntbZp2sLujwH5U4DDGRFUGJOYeQX/zXx2ZzHetoA9o1cQyDNlZHTX2IGsPrzZlf
         UxlYfao8u2x+nGxSx8ok/JVI6g7I299wy+CtSFT37l9Wg45f7elaZwi6YXc1iGUlSC2Z
         ZXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712816648; x=1713421448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39Yd71BvPDvFavN/Z5QN9et3+y8Ad/uGmokVERSjIWY=;
        b=IY9LTWUHfb6IGvZP0lfHS/9m5sZ45hQaltATEHv/IV4rq9NqUle4iIZTW0aGLSE3Db
         HRakXRMjdt1H634E0F1MWvFvtCJhogPlalq5B1fXabFNcY3igZjMztL7UOkwvJtrqN2r
         22kTgYotJOP3751Eq94ypJY/vwVaeQd9pDyN/nj43sjQPMzPF3synASdYwcoThCaqkzL
         E3obScXSv4lkmkDp3zZTp6n7MSOSvoz47ASFXwLsZUj7ABdWtzmti7HGIUzRc1FIUrnH
         c2q7aX22J8SRdjGQ2DkeOgntL+aDULY8laShUdFqzGSPe70+F/xXO3O+iOIyrt//8T7V
         8f5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUh6wQz3BHL69LzSkyLZnSGcnD+oeZm5WYPSwjUSfm4AvEh5ivCTZCdFn4gI3C5bVfsRSTNagmxeB2W5OmbptjSkU8n3a0txU/hQ==
X-Gm-Message-State: AOJu0Yynb8RjoQC7A1fI+AxJo0pWEi+u9s4w+XjWFnYbxYVmTlEBbI2y
	yUwV6RN+5nPo9ay7YLvnBwhiLiFc+R+qV1R6xfgzNJT1fdBQEHoCprVLTNy1LWgd4saChZ+zmXe
	kfofeFHyMIv2D816SwuEu8kz2x4UVxe0Tessi
X-Google-Smtp-Source: AGHT+IHCa3yroBbp77I5AreetFjWSnIDlcpeX5KaLYfaCvdDqDplaRYSCbAannmbRtqlZ7UBOjjBmDKnVUUFpJBUe7Y=
X-Received: by 2002:a05:600c:3488:b0:417:ca55:798 with SMTP id
 a8-20020a05600c348800b00417ca550798mr125117wmq.2.1712816647721; Wed, 10 Apr
 2024 23:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
 <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
 <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
 <ZgF3ACjFj8LtUWgv@himmelriiki> <CAAH4kHbqpaCgZJpF55x2NGWL22rz1ucRewYmR=K2chw2kP6sKA@mail.gmail.com>
 <MW4PR11MB5872BBA0D379C40E071300B98C052@MW4PR11MB5872.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB5872BBA0D379C40E071300B98C052@MW4PR11MB5872.namprd11.prod.outlook.com>
From: Qinkun Bao <qinkun@google.com>
Date: Wed, 10 Apr 2024 20:23:56 -1000
Message-ID: <CAOjUGWdAAtErY30b7H4y3wEGWBMEm1XLSeVeDGnb1NE=V3Ay_Q@mail.gmail.com>
Subject: Re: [RFC PATCH] OvmfPkg/SecurityPkg: Add build option for coexistance
 of vTPM and RTMR.
To: "Yao, Jiewen" <jiewen.yao@intel.com>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	James Bottomley <jejb@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, "devel@edk2.groups.io" <devel@edk2.groups.io>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, 
	Peter Gonda <pgonda@google.com>, "Johnson, Simon P" <simon.p.johnson@intel.com>, 
	"Xiang, Qinglan" <qinglan.xiang@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, ruoyu.ying@intel.com, 
	"Lu, Ken" <ken.lu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiewen,

Thank you!

On Wed, Apr 10, 2024 at 3:20=E2=80=AFPM Yao, Jiewen <jiewen.yao@intel.com> =
wrote:
>
> Hi Dionna/Qinkun
> I am not sure if systemd is the last software in guest we need to patch t=
o support coexistence to extend the measurement.

The direct boot patch needs to be patched as well. Here is the link.
efi/libstub: Add Confidential Computing (CC) measurement support -
Kuppuswamy Sathyanarayanan (kernel.org)
https://lore.kernel.org/lkml/20240215030002.281456-2-sathyanarayanan.kuppus=
wamy@linux.intel.com/
Ard is the maintainer for EFI Stub.

> Are you aware of any other Linux guest software needs to be updated? Such=
 as Linux IMA (Integrity Measurement Architecture)?

You are right that Linux IMA needs to support coexistence. However,
the TDX RTMR IMA support has not been merged into the kernel source
code yet. I have never seen the TDX IMA patch in the LKML as well.

I find that Intel's TDX MVP kernel has the TDX RTMR IMA support patch.
Here is the link
https://github.com/intel/tdx-tools/tree/tdx-1.5/build/common
For what I see, the TDX RTMR IMA patches ([PATCH 672/731] ima: support
for boot aggregate and runtime
measurements in TDX RTMR) from TDX MVP kernel support the coexistence.
The patch author is Ruoyu Ying <ruoyu.ying@intel.com>.


>
> To move this forward.
>
> In Intel, we had discussed and we did see the potential security risk. As=
 I mentioned in the first email, "In case that any the guest component only=
 knows one of vTPM or RTMR, and only extends one of vTPM or RTMR, but the o=
ther one only verifies the other, then the chain of trust is broken."
>
> At same time, we also respect that it might be a valid use case for Googl=
e.
> I would like to ask the opinion in the EDKII community, especially the OV=
MF and CC maintainer and reviewer.
>
>
> Hi Ard Biesheuvel
> Do you think Kernel is OK with this coexistence proposal?
> Are you willing to give "reviewed-by"?
>
> Hi Gerd Hoffman
> Do you think RedHat is OK with this coexistence proposal?
> Are you willing to give "reviewed-by"?
>
> Hi James Bottomley
> Do you think IBM is OK with this coexistence proposal?
> Are you willing to give "reviewed-by"?
>
> Hi Tom Lendacky/Michael Roth
> Do you think AMD is OK with this coexistence proposal?
> Are you willing to give "reviewed-by"?
>
>
> Thank you
> Yao, Jiewen
>
>
> > -----Original Message-----
> > From: Dionna Amalie Glaze <dionnaglaze@google.com>
> > Sent: Monday, March 25, 2024 11:29 PM
> > To: Mikko Ylinen <mikko.ylinen@linux.intel.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>; Yao, Jiewen <jiewen.yao@intel.co=
m>;
> > qinkun Bao <qinkun@google.com>; devel@edk2.groups.io; linux-
> > coco@lists.linux.dev; Aktas, Erdem <erdemaktas@google.com>; Ard Biesheu=
vel
> > <ardb@kernel.org>; Peter Gonda <pgonda@google.com>; James Bottomley
> > <jejb@linux.ibm.com>; Tom Lendacky <thomas.lendacky@amd.com>; Michael
> > Roth <michael.roth@amd.com>
> > Subject: Re: [RFC PATCH] OvmfPkg/SecurityPkg: Add build option for coex=
istance
> > of vTPM and RTMR.
> >
> > On Mon, Mar 25, 2024 at 6:07=E2=80=AFAM Mikko Ylinen
> > <mikko.ylinen@linux.intel.com> wrote:
> > >
> > > > >
> > > > > Looking at systemd-boot I see it will likewise not measure to bot=
h RTMR
> > > > > and vTPM, but with reversed priority (use vTPM not RTMR in case b=
oth are
> > > > > present).
> > > > >
> > > >
> > > > Interesting. Thanks for this report. We'll push for the changed
> > > > semantics here if the spec is indeed changed, and request partner
> > > > distros in the CCC to include the updated systemd-boot.
> > >
> > > FWIW, my RTMRs patch to systemd was merged quite recently so it's not
> > > included in any systemd release yet. (It was mainly implemented for t=
he
> > > UKI case that allows TDVF to boot a UKI image directly and then have =
the
> > > image sections measured separately.)
> > >
> >
> > Thank you, I've proposed a change in
> > https://github.com/systemd/systemd/pull/31939
> >
> >
> > --
> > -Dionna Glaze, PhD (she/her)
