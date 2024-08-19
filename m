Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69E8EEA5
	for <linux-coco@lists.linux.dev>; Mon, 19 Aug 2024 21:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724102758; cv=none; b=YzlfkEn1C2bS+P4lnqbDpdlYpf+48L2qfOhTVMq2nUAQbdnjk0Mtoa+UYU9/mOKIaNKlELcUPyftzRGG0kYg9Wdzzp1k4JaczNxccK01TPQsF+m/+kjJOF0zh709GHd4HSyg1fgDQvjFcOCwIVrluTy9B6OmuvPPsaEKgCSq3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724102758; c=relaxed/simple;
	bh=4gcwvsbDbylR6ALk3uIyPQcaqwI4eJ9JCByYJw9qjak=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cHYa2NpggJMlBLsJD/cnJOfRyXjngzE5cknXhLhNfbiFGJcOcxiXTfyFSS+/VmjL1NpqM1nHMgiXJCszLyRcfLVkh9tv7asQJyBMPakah6Cts/WOJoi8asgZYjqgC3VqBiORP7Boglxw1z6CUUJf9x3dwrYdcDFNG9I8AM+Mca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0zb4yuXe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0zb4yuXe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-201fae21398so27170275ad.1
        for <linux-coco@lists.linux.dev>; Mon, 19 Aug 2024 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724102756; x=1724707556; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gcwvsbDbylR6ALk3uIyPQcaqwI4eJ9JCByYJw9qjak=;
        b=0zb4yuXeFW/RBQlsnuu/kD6+q+Es3qD8Fo+hRUOLJkQTpNyG1SgQY5lOZeaJ/3QzeG
         xxjRu6CRwUyxQr/NXLNPCHaxEZC1qcBlwpvf+EKOpvtIADo5MyC6pTIPC2fPcQ+x2vPz
         6BIeJaBsDU/cCfalDf9yO5aZBrAneIcqmXw1sQ+L1I1/dXaG6zbwWznXVcqfdn1OxGsz
         OMCeiHjeH7lBC/c+B7vnYJQJpOynwtZuOSTHbKtJQR7Qqzdyieu45qfdDROXo9Ao04pk
         TYrYQL8776IH+Lhw0jdIS9c/j0tuPrfFAOhmQE022tIzsYj0mBX5VeP5dN5vHDq8nloe
         ghiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724102756; x=1724707556;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gcwvsbDbylR6ALk3uIyPQcaqwI4eJ9JCByYJw9qjak=;
        b=tO/JoGrBSVfrPvx42CPGXDG7FBX52TxVhCyI5AvzKL+zgmH2myEF4xE97F2zZcN6ov
         EfTjdgio8vkrkd3lURtUl7twExmWhaPDcRvawg5yjSGt9FN6z7Lx/exCUv/yvOOfsy2F
         mR8MnZLlpt8rhH6BMjC/J6tS9wxvrw2qTLAAmdpi1p3/lr7WD8WkQyCAm75FroTJptrh
         Di0+aFrW/73ejVu9plPzTtKENdeFs4h1g5drC10/K/S3XMgqaVR4g2ejZVRKh9Wg6qPg
         3DwhUcU6BjwmRRqgMouCat8Z74c9ypuQTbyEbD/kgE/HKa/7AyoShqqBvzwLZMfLKcwZ
         5GVw==
X-Forwarded-Encrypted: i=1; AJvYcCWcXSOO61QwZySCk31Erg95jIrM3YQfYAWcoZWv3LlSURaMRppQhVoj3ofgSv97yOS5haVe43Wuzd/Y@lists.linux.dev
X-Gm-Message-State: AOJu0YxVs943d8vy2YyIez8L7+tQd38V+Jl2oOY/gJoz1aiKPC/HCPyd
	s/tI2bpjQfeJBF8japDtLA6BcjdlohafF+Kses990HyKCqSZMagahAOE583GjA==
X-Google-Smtp-Source: AGHT+IFQHjn7opTqOCiNaxJXDmg60fElwtXeF7Mqy68b4YAgsiN5PqrB96o0Hinj5H+icTZoy+OWwg==
X-Received: by 2002:a17:902:f644:b0:202:51ca:9831 with SMTP id d9443c01a7336-20251ca9af9mr36829615ad.49.1724102755813;
        Mon, 19 Aug 2024 14:25:55 -0700 (PDT)
Received: from smtpclient.apple ([2620:0:1008:1:a1c9:254c:e95d:4199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0375acasm66870965ad.161.2024.08.19.14.25.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2024 14:25:55 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [RFC PATCH v2 0/4] tsm: Runtime measurement registers ABI
From: Qinkun Bao <qinkun@google.com>
In-Reply-To: <c17a31e4fb30f5f9d4a337e5bd8d54cc6f99eef7.camel@HansenPartnership.com>
Date: Mon, 19 Aug 2024 14:25:15 -0700
Cc: Dan Williams <dan.j.williams@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Yao, Jiewen" <jiewen.yao@intel.com>,
 "Xing, Cedric" <cedric.xing@intel.com>,
 biao.lu@intel.com,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 linux-coco@lists.linux.dev,
 linux-integrity@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Vishal Annapurve <vannapurve@google.com>,
 Chong Cai <chongc@google.com>,
 Dan Middleton <dan.middleton@intel.com>,
 Alex Crisan <alex.crisan@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6DEAEC08-420C-46A9-8877-EBF60331A931@google.com>
References: <20240128212532.2754325-1-sameo@rivosinc.com>
 <c17a31e4fb30f5f9d4a337e5bd8d54cc6f99eef7.camel@HansenPartnership.com>
To: Samuel Ortiz <sameo@rivosinc.com>
X-Mailer: Apple Mail (2.3776.700.51)

A gentle ping on this email thread. We have tested the patch series [1] =
and will release a product based on the patch series.=20

If the patch series can not get upstreamed, the whole confidential =
computing community can not have a way to measure the workload with =
RTMRs. Without the patch, RTMR3 is completely unused. The patch works =
perfectly for our usage case (Like the existing TPM ABI, the raw =
measurement is taken instead of recording the log entry.). Assuming RTMR =
serves as an alternative to TPM-based measurement, migrating existing =
software to the RTMR could be greatly simplified by developing an ABI =
that resembles the TPM.

I don=E2=80=99t object to having an ABI to take the log entry. For our =
usage case, we use the Canonical event log [2] to measure the workload. =
I do think that we should NOT block the patch series for several months =
to solve an issue that TPM can not solve.=20

Link:
[1] =
https://lore.kernel.org/lkml/20240128212532.2754325-1-sameo@rivosinc.com/
[2] =
https://trustedcomputinggroup.org/resource/canonical-event-log-format/
