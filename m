Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3079038FB9
	for <linux-coco@lists.linux.dev>; Mon,  8 Apr 2024 08:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712566256; cv=none; b=H1F9akZuwxImIvqiwpGSUxCOGHVSLTVLLvQMg0ANDhzc+9vCf/Ano4SX8U6p8yoA/9BqzndKN6lchN+BjDbpwXHne8/gFTCCD1wTRAGDKpnFv83RQNwriMO/OLzChuoIeSQa7GOTytaEkcIfKV8rRGfNSnOt7vOUkDi3Anad5og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712566256; c=relaxed/simple;
	bh=nVHvFh1mrxeOF14w7fWe4BN9HTYcPrlSbVLQPdotzIo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=g3LoJT6fuaHRu3FQ2aXalSRFILvJ0Bfvqnj5jr92H0e69RMBYcZCyFh5bfWa0xuDnztGCvUtAlV6bd05SSp7Pw25tHVPtmtAU+3TC2eTY72iB84zB933QcqYBPOFtYitA4KtuJkSTolXpJpoG2ltxU8pvLsQDud9Nhp/2g9Iheg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GwkA5hYF; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GwkA5hYF"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a44ad785a44so487575166b.3
        for <linux-coco@lists.linux.dev>; Mon, 08 Apr 2024 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712566252; x=1713171052; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVHvFh1mrxeOF14w7fWe4BN9HTYcPrlSbVLQPdotzIo=;
        b=GwkA5hYFW+z1oJ3rCIQs99N8yA/TEQKO3FhdeXbchiTjQBkEGy/7PV/3M/YoKOQtM4
         oS4ZB1UBfV4uCrj/6dhfXuvi9fIdk2lHovzkpgDEqQN3VPHWRfxPki+7cbo39pa/9jRC
         P/A52bJaMB0l6ZrvT+SFxMVRs3qWyhU/y6kUUhbd5K01hycYEGdt5Li229yOQ5W4fzMv
         4FqTneuupTfDjBxnKkBg0WYgyRFhxLEGxTF8j5KhU9eaps/fJIVWrBBo/CTtacW00rVC
         rJHJZZsPCx27WCn43Hn6ITcz3ZEeMCNnltTE/9UMZckOZToXEAPuMZoHA42OIgGMpQzS
         YNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712566252; x=1713171052;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVHvFh1mrxeOF14w7fWe4BN9HTYcPrlSbVLQPdotzIo=;
        b=vNBkW/fL8vgedPJNZRrNYj93rd0RZbN/qY8kE8VduSt6BoKGO64c8Q5u3hne9XpVcd
         +mNZgrLmg5jNmEn/xUyZ53nnxPfRA0PMHqnL/rEh7jkHSduDG1AzNxemmo5wEx8RU1PA
         cmw41ir7bswJ7SWzP1wOtLCMObbjKUMC2jkSiW7bwvST7v6VpPy79B8vvNkwF7FV2CCz
         9sIVQjrbIHkmrG5q1ueBAJKDr8IPeWH3xD4ojIW2LYqcTxbjM/7jdKsG0z9AQQ9KUcsT
         oQupPw/maer5x2sW5tANbj32mQE58SK2hfwCoRMslLHM3XX5ST738Dzi5x2O2QBeT1Fn
         sz3A==
X-Gm-Message-State: AOJu0YxupOL8xiY9+eNKdr5NmXQSoWmmnnag3/FMosNplVgVClxTNT4W
	95qe8X3TaVvZEVNK2XA3xmUhl2gWzCe26ZnAKoOmxa6ygPmxDGLsbRWHW9lLs3U=
X-Google-Smtp-Source: AGHT+IF+ZoEfv3UoejJzZvwTqKcfW2KtSfjBjRn8Cbkx2Uuc+GjN7TywXvzDC0F0YhdGtaVCj2f2lg==
X-Received: by 2002:a17:906:c104:b0:a51:aad5:8c62 with SMTP id do4-20020a170906c10400b00a51aad58c62mr6114647ejc.60.1712566252435;
        Mon, 08 Apr 2024 01:50:52 -0700 (PDT)
Received: from smtpclient.apple (p200300f6af31c700281e94157ece4e69.dip0.t-ipconnect.de. [2003:f6:af31:c700:281e:9415:7ece:4e69])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906091200b00a4673706b4dsm4182813ejd.78.2024.04.08.01.50.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2024 01:50:51 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: question on vTPM interface in coconut-svsm
From: Joerg Roedel <jroedel@suse.com>
In-Reply-To: <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
Date: Mon, 8 Apr 2024 10:50:40 +0200
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 James Bottomley <jejb@linux.ibm.com>,
 Claudio Siqueira de Carvalho <cclaudio@ibm.com>,
 Jon Lange <jlange@microsoft.com>,
 Eddie Dong <eddie.dong@intel.com>,
 Simon P Johnson <simon.p.johnson@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C8994858-F06E-44E8-BA57-B47BFB7411B6@suse.com>
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
To: Jiewen Yao <jiewen.yao@intel.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)

Hi Jiewen,

First of all: I it really great that Intel plans to use and contribute =
to COCONUT-SVSM! For your questions, let me add some general statements =
here about how COCONUT plans to handle device interfaces in the future.

> Am 28.03.2024 um 07:29 schrieb Yao, Jiewen <jiewen.yao@intel.com>:
>=20
> Questions:
> With this POC, it seems TCG CRB interface [7] is a feasible option for =
vTPM in coconut-svsm. We are NOT clear what is the motivation to have a =
new vTPM protocol [4].
> Would you please educate us on that? Why not reuse TCG CRB interface =
[7], but introduce a new one [4]?

The current vTPM code in COCONUT-SVSM implements an SVSM specific =
communication mechanism between the guest OS and the SVSM. The main =
reason behind this is that the implementation for AMD SEV-SNP targets an =
operation mode for running enlightened OSes. That means that the OS is =
aware of running in a CVM and also on-top of an SVSM. The OS still =
handles VC exceptions (equivalent of VE on TDX) itself, which makes it =
harder to emulate an MMIO-based device interface in the SVSM. Since the =
OS is already aware of the SVSM and because of the difficulties of =
implementing a CRB interface in this mode, the SVSM offers a =
communication protocol to the OS for using the TPM emulation.

In the future the SVSM will also support the paravisor mode, where it =
handles VC/VE exceptions on behalf of the guest OS. In this mode the =
SVSM will emulate MMIO and it makes more sense to offer a TPM interface =
via CRB because the guest OS might not be aware of running in a CVM =
and/or on-top of a paravisor.

So if Intel wants to support paravisor mode for TDX first and add =
enlightened OS support later, it is totally fine to implement a CRB =
interface in front of the existing TPM implementation in addition to the =
existing SVSM protocol interface.

In general this is true for all device emulations the SVSM will provide =
in the future. In enlightened OS mode it is easier and more performant =
to define SVSM-specific protocols and in paravisor mode the SVSM can =
implement the interface of the real hardware device it is emulating.

Hope that clarifies a few things, let me know if you have further =
questions.

Regards,

J=C3=B6rg=
