Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792426243;
	b=ZVpP/nenYG5jNtLpOCy6i38LPCGSMqB9YPqPtva23v0PmhXHyeVODBKoy07Qz4FH+CTY
	 NnPoPJob/AokiyCudQC41OpPvK3BKzwdJnn4pq1POYzrZMNLJRgBQk1lNwgqK/nGnPLps
	 ijPKL/RuPem+N85JLdlG0qx+jA0lO0SdUZGwSiU9UhuskYuWDkPWgSMe0Tovdj8/vUmYS
	 21xwYGVgOzGJY/EZbiXVAdni2Xb0CcVWnH1DjzAYScdwlbJfzpSAQz/Sf86t/qHbvm691
	 0WMkEihUMM726yrTO2O4R51+15mq9PZFKnymx8CYQFovNfd3b5ZqKGl44Xs9vVPo2rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Kf+lbs9v+6E2jWFkaeqWJS3Ibz3SI0AKrIKdFU2DKIc=;
	b=F0ImV0ixFhJw4r0+z0nZNO1tDpE3rF1RrOZOYcW2/+GXCtv5hV5SJSVC2AN+L7qlcuO6
	 PJwRyY9QvRPx/sTN8YM67y8N/Uj+A9guy/UtrWm4+uRNhiiSfF+MofyxXDMMH5pbZE04k
	 nt3zka2iwkcaiv6V9eq17uJGi+VL7e+BTd5dNwaaW2ETAJItF7F7M95VEl0WDHNF43L5B
	 epJuE4Jqxz6yNc94Wfvt3mitAdWG0fL7PqYlDtXCv/PPoaQMuYld8Kz/JmkuD7XOMaK99
	 FJFkDRPr89LqqIozFSPqXP1rvwJNjU6QSr7RhUOOwikl1wyxSUzrrAHm3XiP0jOkkUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ga82h736;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A36606AAC8
	for <linux-coco@lists.linux.dev>; Mon, 19 Oct 2026 16:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A36606AAC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ga82h736
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so1082572a91.3
        for <linux-coco@lists.linux.dev>; Mon, 19 Oct 2026 09:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426242; cv=none;
        d=google.com; s=arc-20260327;
        b=fU19+5PM/RVVM/nRo1TDSpLb8I1d660UX4/wvilVmORv1+bp2MTZcA8HAHu88WpG2r
         k5AyM4gGnWlo2D3PPE9Lrl9Z9JfZgIc+XRCLqLoebEEYI9Lywbv2XBiEsRZhMZMGFRVm
         Mx5P/IKqrqjk/M4btnIyqPSRfHyblDRfwhD5q8eD8DP+lIK2glDDYTGQ3b3K31s0hDX1
         Lfvh5NC32GiQlqY+N9YNkTUrJHZgfnatzy2eJuJs8qKOBcUSRazXgrYPd6Em/73VrSem
         vt+BdlugV0VaO/p0cgig7tkpxP9pbQZVh0HNQylmD/r/d1MKx8zVvVDw0J2P7GRo50Iz
         frNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kf+lbs9v+6E2jWFkaeqWJS3Ibz3SI0AKrIKdFU2DKIc=;
        fh=JQTxgsXv3xY8QUmNQTVo1z13CgSD8+y5qa5XOyccI2s=;
        b=X09hUNX5698JZ7spSNg5HCclwq6iu+k4nhej5iLPuJ8WwsJdWAbJRXa9CI+LJgsTSQ
         Xe1xu3UmKuDLVC3+bBCJVRA76Uz/mSGTadq5x5hbArK0vbFN8kbiG7Uxr8A3K0HGoO1q
         VqiWazjcoOcNo6pkfNfCyYHHeLgmy92diZYtxoW7odEXu/SEpcPILMxPBfYqK5u/R7cD
         BtIJzVe0YfegOVK2eEiRV2cusi7TRIg9gaDNukqz9PW52IVSTg4WFrlNam3YYCamtCVv
         6GbNYzBcdlNKDlaoSxAQzECJtYyTZgpiEEzTMVtuB1H4ewwZCfxgQrMkWOculduaCtN2
         BvMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426242; x=1793031042; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kf+lbs9v+6E2jWFkaeqWJS3Ibz3SI0AKrIKdFU2DKIc=;
        b=Ga82h736XiO+3FMLjOcI4B/TAHpHKxW8/K7bZIJ/Bl7+0affIXhntJWezrQoZvKfJK
         HtlOB8LLXAS9/OgH25ZUfbdCaxDLx1cpF/+VgJ3JDXE80NFUQavp4PFHxESNsHkYKKnE
         m9Ox9BFm9jX73O72H943Dkd/ZYvZ2D5M1/B/PP6Om1z2vFJgYlUYdu9LELWAyvW2KVKU
         BviDSHmbtbCEKibH+p4H4LykRw7R7pHcLs0WdN85yHS5SbNOrwInNK5RM2UFirByoxNx
         slm4O51tguzJGtulRD+R8X3pAihSP18NNtU3O8jO9U26bvbNfx3Uff+tsaM4I03nE0LS
         46Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426242; x=1793031042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kf+lbs9v+6E2jWFkaeqWJS3Ibz3SI0AKrIKdFU2DKIc=;
        b=LPg39fBg70sV7fRAwZ1zcXQA/sPB1/p5A0U11jIYdhND0TUFWXDX/JuyFVQgZzyTUH
         /5NhRq3hFzHLurGVdLgSfauUBbx+NnB6YCGlgYeDx5/SBrc8A0u9hocOPs1LywWmwSRl
         lz40XiZGNCGYNv8yKYr1XQPSUkBSWSLznbzmrrbRETXbiPF9Uj1PdKzWpc8Eyxu9J8d6
         FtmNXfAwviGE7vLOdCvsAG7y3L/g40hYP7lJ4DUuzk8ikkNDfZUsCJ72FKc2upZs89A4
         4uFBZ+QgIQe+AFvwJghZp18XxFMhceoTqjlh7+KIQFhNwcNsUyYfI8IwWpxz1ikwQxcN
         xrew==
X-Forwarded-Encrypted: i=1; AKwUvByZAwJyC2ukZGd8NnpVsS5bBwSLW0Ghry4Hebit1Fs12pDZEPdM+F092aD+oYB8UkF5+tcTJj3SLzLv@lists.linux.dev
X-Gm-Message-State: AFq9FYLjgGjZGVat43fMuaVjC1H387QV0PjDkv2OjZXIF26kGZgmahYm
	7uirPdnNx9Bp/PlUxMjBJHuwzZQssihXByVOH6tR+Cv4zJHhAWSOudiXyILN1Iv5FyNv0ZCbl9o
	8ouiRWx0gCpTVrukZYi7gbXCWj44A5H8=
X-Gm-Gg: AYBFou2sSm51CdGe/f25RRZSZW4wKvmU6m3AXWaLqXzq6DJepJugT+IC6DB+Eh5WP22
	J6EgvGaci1zm7WN6Uh0JJTqt7gDFEMmH2Ysedp6ObH1sON7+U4HbhkuYaUR4SfmfhYwlvro/y05
	qIKNxwztEUGj0NCRbFnVgHR7S0QnYmMyW46OmxUHsrUqWSF8thyRMEMQGSdIJSCgskyRqIs/D7C
	pfTb7yjATwpgDfD3GOMg3uQ0SZNv4W6UFA5hgnejbeohKrKJU1sBqkKrhgLeNzl4pFH0JAxXh1H
	meN2DA3uer9i1tQqO8ORa66jej4aUN06JD4h6w/Td6vU3xVqZLJE0d1OwHP6EfX3pwRS3TmOBV0
	mbMYXzJdqKgKk2KetAQ==
X-Received: by 2002:a17:90b:5623:b0:3ac:9a54:e3ce with SMTP id
 98e67ed59e1d1-3acef6391ecmr7235023a91.63.1792426242489; Mon, 19 Oct 2026
 09:10:42 -0700 (PDT)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261015145053.3664509-1-jiri@resnulli.us> <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com> <atPgqROZZxnihYfC@kernel.org>
 <20261017231007.GP13920@nvidia.com> <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
 <atX9fugGUsI0hGcA@FV6GYCPJ69>
In-Reply-To: <atX9fugGUsI0hGcA@FV6GYCPJ69>
From: Dionna Glaze <drdeeglaze@gmail.com>
Date: Mon, 19 Oct 2026 09:10:31 -0700
X-Gm-Features: AclHuK-94VeGPXxFeBfuxcNfO58AYvUbUlLP8AwazUPyHejofcyDyE2ymf8gT_k
Message-ID: <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX support
To: Jiri Pirko <jiri@resnulli.us>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, david.quigley@intel.com, 
	lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, 
	roberto.sassu@huawei.com, zohar@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:08=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote=
:
>
> Yeah, I was thinking about this and went back and forth. In the end, the
> only reason for leaving it unbounded is to allow multiple independent
> users of the same register. For example, IMA and systemd could share a
> TDX RTMR. The systemd side would read the journal through the
> attestation device and the IMA side through securityfs, but both are
> views of the same journal. If one side truncated it, the other could no
> longer replay the RTMR. Isn't this the valid usecase? Do you see how to
> resolve this?
>

Bright minds have spent a significant amount of time working on this.

+Roberto Sassu, +Mimi Zohar
IMA logs and systemd logs are both system level concerns that are
relevant to the OS construction, not individual users,
so I would just say to reroute IMA to use ctlv using a kernel config
setting, then make systemd the new system manager of the holistic log.
The securityfs log contents can simply say, "log managed by ctlv" in
this setting, in the form of the template identifier.
For policy violations, only the 0... extend needs to go to ctlv.
IMA can still keep its violation log as a ring buffer when it's not a
1-to-1 violation to extension
https://www.youtube.com/watch?v=3DgyYUYbdiN_4
