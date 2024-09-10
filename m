Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119A21A0B16
	for <linux-coco@lists.linux.dev>; Tue, 10 Sep 2024 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725988182; cv=none; b=iRhtzRtU4zbeLTuGByolo0cG639FGfe9r1RMPR30zXrBq+9r/5OzByiKtlxHH7777d1d/M0Z0bBqOcJoR/GwtAX7q14jfG4Hr1USr9ll50+8No00gRF6GqmBT56hNynZqgR4cocygJ+hswZbwWB1UgcqGvylq74s5lprrkUf+HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725988182; c=relaxed/simple;
	bh=Q6auIC+lfOrkaQD7rvLfX0p7Yv5KiBmeXvQVux4a+iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+DtaX+wWMDPDCOXHDAkDmTeKvdca2EkFCxNRYBoBl+ZmKVHfSddHIwiSGBnTABky8QcpFbHOhtW4VlvIFzMQ2DNdyaRcxr64Kw85J+Lx97SAgX490EnFVltbrRKzTA4N4O6TfzoL54OVtTDk24xh+ZQhIIJFrsGCU8kbK/U3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pYR0NGVq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pYR0NGVq"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cb806623eso9696485e9.2
        for <linux-coco@lists.linux.dev>; Tue, 10 Sep 2024 10:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725988179; x=1726592979; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=utLbwR6IroeB0AEHzwu823rdkJ+TU7LsinBibL/Tkok=;
        b=pYR0NGVq4g2OtcWh3QJoSdeERe0i+rKVQrMEBMObOf/BuWvAwDqqbz1XQxli0gKdx1
         zEZwQ30wubXgCPSJKoblWXA0iGOwWZc37Q8/teceyWX9J7nU8YV5fsmqFffVXqhksOGw
         Z+DbtlaWlzLtDSUWhcvkS1lCQ8+69C0SfTZrM43AXB4sGxd/uKw17EOfPi+95ASd+q4h
         Tw+nw6rhRrbbfVNPjg+2Gp8bUPrIryvGuL7uIaC3jVxO1rXuKvbtQ10vQbil+A5fc8Q0
         oqT3gB5zjdNPtdMQBOp97I9SO8vP1uTOnuhKYgTq8Bj4+OQK0J3Zf+bb1niY6hHnxToE
         RT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725988179; x=1726592979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utLbwR6IroeB0AEHzwu823rdkJ+TU7LsinBibL/Tkok=;
        b=sbUXhqD/WPAavHrjUrENF5Ifaa8zSegSDJqrsE2nGs6uOWUG6+1RxFuuK5icah0gVh
         XtlmmUwe33F9pfsB1XjFUN8eVYATbiFvKmFQKW2SXd6+q8micHmDHHELuiUOAaYJE8rC
         hyKv3AR+zMGjPXmPfUd6KSAl5qXcG7mH5qOfKSnz/bj/womn+u8Q3ihKrfa/yie/9bYk
         MMIaU9CS3mkuzAEjXL10qtwmCia6/kSbXnOMwPCcjfh4P8GkavCGD7ovDTyRdhtLzikF
         IFVSVnjWXGl3dXfYlnrWC1L+eR8Ukl17vGy5reVbCzSnk8URr+xpsG/BKV0S+LK5mvu9
         0b9g==
X-Forwarded-Encrypted: i=1; AJvYcCUZwSojZ2Yni2rXQbf9mO2g0l7FTgLDSY/dx4T26i7baIPG1AD3wGACESBjm/Tvng7EE0E6E1nK1eZC@lists.linux.dev
X-Gm-Message-State: AOJu0YyOH+BwYPQ55NiTfN3Jlyenct1JAKjfhvbMnb0PZnNU+R/7Al4W
	sRnkO254fhcSIt7uwIjGEn3sgbmyngNQr5lCQseAzZn9eRYylNzKjelOQ2zrN0M=
X-Google-Smtp-Source: AGHT+IF/QsQfgvnlDNwRI/26MNhGa5Ilm/ivjQU/jiSisbtZcTQW622/yOPDugknPq9MM5U+7aE9Qg==
X-Received: by 2002:a05:600c:4fc5:b0:42c:acb0:ddbd with SMTP id 5b1f17b1804b1-42ccd30c1e2mr3015145e9.7.1725988178642;
        Tue, 10 Sep 2024 10:09:38 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956653d1sm9391066f8f.33.2024.09.10.10.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:09:38 -0700 (PDT)
Date: Tue, 10 Sep 2024 18:09:59 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Cedric Xing <cedric.xing@intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Lukas Wunner <lukas@wunner.de>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Qinkun Bao <qinkun@google.com>,
	Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	suzuki.poulose@arm.com, sami.mujawar@arm.com
Subject: Re: [PATCH RFC 0/3] tsm: Unified Measurement Register ABI for TVMs
Message-ID: <20240910170959.GA213064@myrica>
References: <20240907-tsm-rtmr-v1-0-12fc4d43d4e7@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240907-tsm-rtmr-v1-0-12fc4d43d4e7@intel.com>

Hi Cedric,

On Sat, Sep 07, 2024 at 11:56:18PM -0500, Cedric Xing wrote:
> Patch 2 introduces event log support for RTMRs, addressing the fact that the
> standalone values of RTMRs, which represent the cumulative digests of
> sequential events, are not fully informative on their own.

Would each event_log include the events that firmware wrote before Linux?
I'm wondering how this coexists with /sys/firmware/acpi/tables/data/CCEL.
Maybe something like: CCEL only contains pre-Linux events. The TSM driver
parses CCEL (using a format specific to the arch, for example TCG2),
separates the events by MR and produces event_log files in
/sys/kernel/tsm/, possibly in a different format like CEL-TLV. Is that
what you envision for TDX?

I ask because I've been looking into this interface for Arm CCA, and
having unified event logs available somewhere in /sys/kernel/confg/tsm
would be very convenient for users (avoids having to parse and convert
different /sys/firmware interfaces along with Linux event logs). I would
have put a single event_log in /sys/kernel/config/tsm/report/ but
splitting it by MR should work too.

As Alex I believe we need more similarity between the interfaces of static
and runtime measurements, because verifiers may benefit from an event log
of static measurements. For example Arm could have a configuration like
this:

  struct tsm_measurement_register arm_cca_mrs[] = {
	{ MR_(rim) | TSM_MR_F_R | TSM_MR_F_LOG, HA },
  	{ MR_(rem0) | TSM_MR_F_R | TSM_MR_F_X | TSM_MR_F_LOG, HA },
  	...
  	{ MR_(rem3) | TSM_MR_F_R | TSM_MR_F_X | TSM_MR_F_LOG, HA },
  };

Here rim is a static measurement of the initial VM state, impossible to
extend but could have an event log. rem0-3 are runtime measurements,
extensible by firmware and then Linux. None of the digests can be written
directly, only extended and read with calls to the upper layer. The tree
would be:

  /sys/kernel/config/tsm/
  ├── rim
  │   ├── digest
  │   ├── event_log
  │   └── hash_algo
  ├── rem0
  │   ├── digest
  │   ├── append_event
  │   ├── event_log
  │   └── hash_algo
  ... 
  ├── rem3
  │   ├── digest
  │   ├── append_event
  │   ├── event_log
  │   └── hash_algo
  └── report/$name
      ├── inblob
      └── outblob

Thanks,
Jean

