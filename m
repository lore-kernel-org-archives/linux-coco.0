Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D41025393E
	for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 05:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786686364; cv=none; b=sosBVljgQ/+QwQeAVB+YU9UZ6651dYydJmWJ8J1We89ahXpUCmTnE9UbE6c0RKLGwa4pKRMZU/aApobvS04azpdRJ/knqqFcZ8CQiwln7pYdSKPMA131AfD2xV/qg+XhIl2gigculXjuT5GDiUifIj1ZNDQsLLk9zQPjWSmHSGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786686364; c=relaxed/simple;
	bh=B5+V8aDXSgyHBeZtsMhJdBvt5jrhqFzJiO/bvbPuF3Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WHP86Irnoq72W4wbtB2GKcuLsi0xkGAmygHXa4Dm3CpZsBXc5HNggV2NywDZoHJFJPbAKq0S2U5vpjT5rXgqFduN3oYYVXj0EI1Ek3b2g7JaeUkmEzHNyY/HVgWR81Ri6/ysqTyuHCWWzXQDyRJfn+6keL9ng/kWfWUd+4Zexx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTjMwCl6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTjMwCl6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f7854678cso463301f8f.1
        for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 22:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786686361; x=1787291161; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Q8H/CbRo+VwI/8mgs+C0XfBgtzPkoXXEyoqc4BkrmCk=;
        b=kTjMwCl69ECc9vFo5Nr5oJYxxZ8FNztf2RSzDFxGVJ3OHI9SjRmko+IMPu8Cuc3c94
         LLpx8cORNyaFI8oKe20eUO8ObH4R2wX+WBYEWpDfJ6epHwC6VZX0V+/IQNZ66ig3PuPP
         Ee9a12AFSvnotMG3xcROSRnQgsnnk5ybwUTV/d0XYL+zah+/WcOqOzyETPBVZvcO7065
         NDd3qJA4vccx3J9bWZuuasFE1PtSnoKjfuuNhl7ZTyF55dHkvpN1FtEKB1MwqbL8EsDB
         G3F7EYYSt5VCjEzpY3XtjesgOmztxHjvj1beKDOaFZZS4euaOKN2H1VboMD0WuE31FK+
         IiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786686361; x=1787291161;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8H/CbRo+VwI/8mgs+C0XfBgtzPkoXXEyoqc4BkrmCk=;
        b=Z+uMJp2BAUFQDOPNXnmGmauCba9vPBz4yntgOBYVjwcEqq6slt+bcH6HPpwCoya/WJ
         +YxcKNKjgR5DdFsL+v0mmR2y6XQjArtTcNlOCKOOFBIO17sup7x2E4PhGxErPG2EsIAS
         OkAVZunmSkSqMvnejzkGTwTPMDdV9gTqfVPlaYXeyoxbvwtNxHNthiiolNRFR+04bn3v
         yVqjBZbSd4WOopaKvFE6p0rAnTcQPEvIGDT8oWeUOBbItMA2xUUzIZxw6VVoiqwaefQK
         vJiipOjOaUYBrevxi9Ar3gz4JHzzHKkW1pc6LijOl5X7LwkXL+anXrS0v7mIlFe9Liet
         1BGQ==
X-Gm-Message-State: AOJu0Yx0bq2wHF364n9i1Zg7Yxbf1mTLBTH1Bw6KG7xeiW1EMqdrGX63
	Lf5MqA3Vd+sImCokxIreKpo2CTr1BKWAzIY7W5hsMSWK+MvtjmHCBFxP
X-Gm-Gg: AR+sD1188W9iUaowu8KdvEJeGyxhF/paSCpf9AX9aJCmZY/S8JKQqI7apqetBp+u5FB
	UBGkxrnsHqJXXY2NNyB426PbccFIm3YTpQbnCoLiGLb55yG1FWpsVsDQoVPoNdBXaYp6txE72aC
	F/jbYe4KbzHD13dP5PlEg0qzxO7Ew7f2aYuom70Xx9ZOF8jxDPrGrml1PEe845M8fZ21wUsuYec
	wn3uqDV9VHRVukT0TRl52Qrznmh5SweB4+alwgT8raGaOqowT4t3wwnX9Dm6DvaoqrqJjw1DjIp
	2zBYgZgRoGJs3ADBzYxDiq3WDI8KJ6evhtmMVcJ5f+lj1kbyHo9irWIuPJB5gH7m2rV2O7gTTq1
	fOrEt5TuvG0wYEl73b0hws/PI4SEB0RrBX//9U3l8WvaDKzkPXLbs9qPdFvLS64cN+SaZ7rBtGS
	2W6bmRuki2LRBZYfo4h8/oXbvjpPeoVsZlhgSHby5eefIGlIDkCxsOwc69zICNquRr
X-Received: by 2002:a05:6000:2612:b0:47f:c648:e265 with SMTP id ffacd0b85a97d-48160758afcmr4474351f8f.17.1786686360494;
        Thu, 13 Aug 2026 22:46:00 -0700 (PDT)
Received: from [10.245.244.143] ([134.191.227.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-481626fd0f0sm1280557f8f.28.2026.08.13.22.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 22:45:59 -0700 (PDT)
Message-ID: <8b432c8731167e97432b2e917d0b1c855fedf47c.camel@gmail.com>
Subject: Re: [PATCH v3 0/4] tdx-guest: Make Quote buffer size dynamic
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "seanjc@google.com"
	 <seanjc@google.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
 "x86@kernel.org"	 <x86@kernel.org>, "dave.hansen@linux.intel.com"
 <dave.hansen@linux.intel.com>,  "kas@kernel.org"	 <kas@kernel.org>,
 "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>,  "Li, Xiaoyao"
 <xiaoyao.li@intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, 
 "sathyanarayanan.kuppuswamy@linux.intel.com"	
 <sathyanarayanan.kuppuswamy@linux.intel.com>, "bp@alien8.de"
 <bp@alien8.de>,  "kvm@vger.kernel.org"	 <kvm@vger.kernel.org>,
 "tglx@kernel.org" <tglx@kernel.org>, "hpa@zytor.com"	 <hpa@zytor.com>,
 "mingo@redhat.com" <mingo@redhat.com>, "Fang, Peter"	 <peter.fang@intel.com>
Date: Fri, 14 Aug 2026 08:45:55 +0300
In-Reply-To: <4ad451969522eecb445289ca74a88ee73d51336d.camel@intel.com>
References: <20260729122939.1340412-1-peter.fang@intel.com>
		 <e0a90fba3f8424412387aa08f1fdc708abeedc73.camel@intel.com>
		 <80b4ea89ebf17398c3bee21d157c7f97ea32aadf.camel@intel.com>
		 <anxvwV_Pz4UYaxxt@google.com>
		 <86d532f33816cd4fa3e29c40079a6003abf89324.camel@intel.com>
		 <anyiwqi9i0NSv0QW@google.com>
		 <ed4891a59096c59e43a893910c9f17d0ff6086b8.camel@intel.com>
		 <20260812223707.GD1013044@pedri>
		 <6191a69559e58e04c8e3f1efa776e9639796af3d.camel@intel.com>
		 <anz9b6CDkhr5D5RG@google.com>
		 <c697ff1d97fe62882eaf3bd86a4213bf2e79fc09.camel@intel.com>
		 <98dcc8a12f117745a1cb9981dc8f0f1548e9c96f.camel@gmail.com>
	 <4ad451969522eecb445289ca74a88ee73d51336d.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2026-08-13 at 20:14 +0000, Edgecombe, Rick P wrote:
> > 3. Why freezing TD report size
> >=20
> > Linux supports 1024-byte TD reports via the `TDX_CMD_GET_REPORT0`
> > ioctl. It is already full, no more TD evidence fits, and changing TD
> > report size would require a new ioctl.
> >=20
> > Also, as I understand it, based on TDX feature requests from customers,
> > there may be a need to increase TD report size more often and more
> > significantly than one would expect.
> >=20
> > Therefore, for DICE-based attestation the TDX module adds new TD
> > evidence in the quote instead of expanding the TD report.
> >=20
> > Is this the cleanest approach? Maybe not.=C2=A0
> >=20
>=20
> I was thinking the cleanest, time-travel facilitated, approach would be t=
o have
> the "report" really just be a replay protection thing and not include any=
 TD
> details. Then the quote could add everything it needed in the final forma=
t
> location. So no re-verifying and shuffling things between formats. But si=
nce
> that didn't work for SGX based attestation, the report has extra stuff du=
e to
> legacy. But from Linux's POV, going forward we can consider the report as=
 really
> an oversized replay protection blob and forget about the TD details in it=
. Isn't
> it a pretty clean separation of concerns? And for Linux (guest), the bene=
fit
> shows up in not having to increase TD report size since it has really onl=
y one
> job.

Replay attack protection is a binding value between the remote party
and the final quote. It must sit in final quote. It only needs to exist
in the TD report because of the 2-flow design.

But why DICE-based attestation uses 2-flow design? Could TD run a
TDCALL[TDG.GET.QUOTE2] or something directly. No concept of TD report
would be needed. That would be my current vision of "cleanest".

But the approach that was taken is to minimize software changes. Within
that tradeoff, keeping the 2-step flow, preserving the TD report format
and size absolutely intact, and adding the extra information in the
quote is arguably a clean practical path.

Is this the cleanest in some absolute sense? No.
Is it acceptable? I would say yes.

> >=20
> > 4. Migration-specific case
> >=20
> > For the normal user attestation path, the TD report is TD-scoped. For
> > migration, the report is effectively platform-scoped, just because the
> > migration flow does not need TD-specific evidence.
> >=20
> > I would say that clean design is when Linux does not need to know this
> > and care about this specific case: be able to treat all TD reports as
> > per-TD.
>=20
> I was hoping you could chime in about the thing you mentioned off-list re=
garding
> *when* the quote operation is needed for migration. As in, what stage of =
the TD
> lifecycle and how it fits into a KVM VM TD scoped ioctl.

The first step in TDX live migration is `TDH.MIG.SETUP` seamcall. It
is=C2=A0called multiple times on both the source and destination hosts.
The TDX=C2=A0 module keeps the setup session state and drives the protocol
by telling the VMM what to do next through exit codes.

Each call follows the same pattern:
1. The VMM calls `TDH.MIG.SETUP` for the source TD or the destination
   TD.
2. The TDX module reads the optional input buffer and may produce an
   output buffer.
3. The exit code tells the VMM what to do before the next call.

One of the possible exit codes is TDX_MIG_SETUP_GET_QUOTE. It means:
deliver me the quote. The output buffer contains the TD report.

The idea was to pass this directly to QEMU. QEMU would call the
proposed "get quote" ioctl on the TD under migration, and provide the
TD report from `TDH.MIG.SETUP` on ioctl input. QEMU would not need to
care about the scope rules and would just treat the TD report as
belonging to the TD under migration.

The ioctl would then run TDH.GET.QUOTE with TDR for the TD under
migration. The seamcall would handle the scope logic internally. It
would be an internal TDX module detail.

Did you mean this or something else?
