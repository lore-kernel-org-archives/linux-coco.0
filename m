Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F4113C809
	for <linux-coco@lists.linux.dev>; Thu, 12 Sep 2024 10:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726135403; cv=none; b=bTMn2z+y138qF8zcDEkusVlASU8nUKFCVSUF23lCQLURDgnOzEDFsTKJBaTp/XyT+AjLkmaMkKAk6vzeKjMfCQWrzslaJK1c8v1s6lPwkstJ6rUexLnRBcXT+SPsvT7IArTU61AWfnXLVvU7jotk2QrYztyrS+2Tz3VjjlSAk8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726135403; c=relaxed/simple;
	bh=JUqm4OZN/nZc/FvnrnKKOYmfgXhqvycfJhtIj6F7GA4=;
	h=Mime-Version:Subject:From:In-Reply-To:Date:Cc:Message-Id:
	 References:To:Content-Type; b=s3OiGGTq0qKfqrGDp/I046yAc7E6WIBvxcK2VGgQziTujBcd+g8AWO4xtYzoG2qnXVABwvPdR/toxyLvhMuNAwbe4LDh/fqIRLd8D5jYpG8tcLKswFxUtYvoP72bqbNY29q21C8lUldPSbp+uhYesFs3daIYAgmgfVvnfsoRSeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i2e4HDl1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i2e4HDl1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726135400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w93uWj0/DKpx7asRT7+lFE9wBH6BECvrbmCN5noEgK0=;
	b=i2e4HDl1BmkmSrJF48ctBzvrcoj2giNB8AP9ht0IyIAlo5pvXuoLyH85og+qcrQhBPq4YP
	PQXTKrV6hBs9Sq07536pU59y6Ebul8hQ0LXxtpY7ttz/SE2cptgUElf28T6/EsG7s0mTZe
	z9vDHx1mQBw4nBItzeh6P/1S3OvM0D4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-748lgrgPPpON6w3iJ0N6lQ-1; Thu, 12 Sep 2024 06:03:19 -0400
X-MC-Unique: 748lgrgPPpON6w3iJ0N6lQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-374c90d24e3so585232f8f.0
        for <linux-coco@lists.linux.dev>; Thu, 12 Sep 2024 03:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726135398; x=1726740198;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCJ6guOeTEcTTh+w2qVEF4teB7f7Ek+oqcFW+1dMKBM=;
        b=AiZ2HMDZyVBE1DtMeqBfWD/mgQPIFQIP41iRVe+H9zFoJfTNMyK/UVO5TQYNWFY1pK
         QOm+hE4qBNEj3MTvio7g+VI430opIHKkXwPGo6Rz0Hz90OJ1F3PM3eUVwTYv4O7/ckMH
         c8xS7YNiMuzB/mTKm0x56TaK1sxK76XtlZZY4d4DtWuIvA6QcRDhkTWZb70tMKnU0Jpm
         +NZa9bPnWGByqfG1MmSnEleEriW/5jHHMUBgbRaibjfGr7K+pZvr49mA3hYgatQuKjhH
         nXtgufd1ZRFv+mmaHK77xsIaw+sKEJX3bYZZByzvQWfe6zN7PuCx3M5EkUSxSfBjI/Xo
         eb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIGWxlRVKF59UDqQsn15XbpJmJe6nr8m5B2cVdxSuKxczufSMozvZL5LurkkJKTYVimWaF3J1BIyGb@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr08/Cy4/LRzK6ETLZ30lRbB/JCNmiUO9i/iS5gtswhNkAMhpt
	J92muo9fitccd6yr/lKaHSXbHSuHqgtnqm4ZrXjBC54elkh3/Bg+hz9mRmsBen4PQ0txSqm415r
	pNDcVfktDHTLCKyAeBgzhpF8/t+EkjOcIKQjUk3Li6463QGJ8e3bkBUA/fFU=
X-Received: by 2002:a5d:4bcc:0:b0:376:f482:8fdf with SMTP id ffacd0b85a97d-378c2cd3c39mr1796949f8f.4.1726135398305;
        Thu, 12 Sep 2024 03:03:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8k1byIvdqmt1lPafBJ2eXMBNnEv7fdO3q8tQ+WQPmp6wBywPH1oGkkgRhnuRlKSGPrRK3Vg==
X-Received: by 2002:a5d:4bcc:0:b0:376:f482:8fdf with SMTP id ffacd0b85a97d-378c2cd3c39mr1796893f8f.4.1726135397129;
        Thu, 12 Sep 2024 03:03:17 -0700 (PDT)
Received: from smtpclient.apple ([2a01:e0a:834:5aa0:9d72:19d2:fff7:1a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de3f0sm13813390f8f.113.2024.09.12.03.03.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2024 03:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH RFC 0/3] tsm: Unified Measurement Register ABI for TVMs
From: Christophe de Dinechin <cdupontd@redhat.com>
In-Reply-To: <20240910170959.GA213064@myrica>
Date: Thu, 12 Sep 2024 12:03:05 +0200
Cc: Cedric Xing <cedric.xing@intel.com>,
 "dan. j. williams" <dan.j.williams@intel.com>,
 Samuel Ortiz <sameo@rivosinc.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Lukas Wunner <lukas@wunner.de>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 Qinkun Bao <qinkun@google.com>,
 Mikko Ylinen <mikko.ylinen@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 linux-coco <linux-coco@lists.linux.dev>,
 suzuki.poulose@arm.com,
 sami.mujawar@arm.com
Message-Id: <B3201E6B-D479-45EE-9E44-868042E04E5B@redhat.com>
References: <20240907-tsm-rtmr-v1-0-12fc4d43d4e7@intel.com>
 <20240910170959.GA213064@myrica>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 10 Sep 2024, at 19:09, Jean-Philippe Brucker <jean-philippe@linaro.org=
> wrote:
>=20
> Hi Cedric,
>=20
> On Sat, Sep 07, 2024 at 11:56:18PM -0500, Cedric Xing wrote:
>> Patch 2 introduces event log support for RTMRs, addressing the fact that=
 the
>> standalone values of RTMRs, which represent the cumulative digests of
>> sequential events, are not fully informative on their own.
>=20
> Would each event_log include the events that firmware wrote before Linux?
> I'm wondering how this coexists with /sys/firmware/acpi/tables/data/CCEL.
> Maybe something like: CCEL only contains pre-Linux events. The TSM driver
> parses CCEL (using a format specific to the arch, for example TCG2),
> separates the events by MR and produces event_log files in
> /sys/kernel/tsm/, possibly in a different format like CEL-TLV. Is that
> what you envision for TDX?
>=20
> I ask because I've been looking into this interface for Arm CCA, and
> having unified event logs available somewhere in /sys/kernel/confg/tsm
> would be very convenient for users (avoids having to parse and convert
> different /sys/firmware interfaces along with Linux event logs). I would
> have put a single event_log in /sys/kernel/config/tsm/report/ but
> splitting it by MR should work too.
>=20
> As Alex I believe we need more similarity between the interfaces of stati=
c
> and runtime measurements, because verifiers may benefit from an event log
> of static measurements. For example Arm could have a configuration like
> this:
>=20
>  struct tsm_measurement_register arm_cca_mrs[] =3D {
> { MR_(rim) | TSM_MR_F_R | TSM_MR_F_LOG, HA },
>   { MR_(rem0) | TSM_MR_F_R | TSM_MR_F_X | TSM_MR_F_LOG, HA },
>   ...
>   { MR_(rem3) | TSM_MR_F_R | TSM_MR_F_X | TSM_MR_F_LOG, HA },
>  };
>=20
> Here rim is a static measurement of the initial VM state, impossible to
> extend but could have an event log. rem0-3 are runtime measurements,
> extensible by firmware and then Linux. None of the digests can be written
> directly, only extended and read with calls to the upper layer. The tree
> would be:
>=20
>  /sys/kernel/config/tsm/
>  =E2=94=9C=E2=94=80=E2=94=80 rim
>  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 digest
>  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 event_log
>  =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 hash_algo
>  =E2=94=9C=E2=94=80=E2=94=80 rem0
>  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 digest
>  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 append_event
>  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 event_log
>  =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 hash_algo
>  ...=20
>  =E2=94=9C=E2=94=80=E2=94=80 rem3
>  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 digest
>  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 append_event
>  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 event_log
>  =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 hash_algo
>  =E2=94=94=E2=94=80=E2=94=80 report/$name
>      =E2=94=9C=E2=94=80=E2=94=80 inblob
>      =E2=94=94=E2=94=80=E2=94=80 outblob

It=E2=80=99s nice to have a similar structure between ARM and x86, but how =
does
user space know what each register holds? For example, say that I want
a digest of the initial VM state, of the boot configuration, of the
command line, or of the firmware, where do I get that? When using a TPM,
there are conventions on which PCR stores which particular piece of
information.

Is the idea to defer that to user space, or should we also have some
symlinks exposing this or that specific register when it exists under
a common, platform-agnostic name? e.g. on ARM you would have

/sys/kernel/config/tsm/initial_vm_state -> ./rim

It looks to me like this could simplify the writing of user-space
attestation agents, for example. But then, maybe I=E2=80=99m too optimistic
and such agents would always be platform-dependent anyway.

One data point is that about one year ago, CoCo has already split the
platform dependencies away in their attestation stack, at the time
mostly to cover differences between AMD and Intel.

>=20
> Thanks,
> Jean
>=20
>=20

Cheers,
Christophe de Dinechin (https://c3d.github.io)
Freedom Covenant (https://github.com/c3d/freedom-covenant)
Theory of Incomplete Measurements (https://c3d.github.io/TIM)

