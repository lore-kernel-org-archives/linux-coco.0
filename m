Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97242341670
	for <linux-coco@lists.linux.dev>; Thu, 11 Sep 2025 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757598073; cv=none; b=TjHL0r/SO6uC6THT6sxmdzJKGJlCzPXWHMS8dfzUcQKBqnqdRy62/HYmEUvrrSUQ5L2o+7C+/8cvQzYp+YbIOI537/bt3tdluhBFrHPHQPUq57tnCvJlRmwGX8RcWXwX0/a4Cd+8yoPhM29lYgoyZtzyPd9STsABExI+EKLEgQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757598073; c=relaxed/simple;
	bh=eLNCihb73AkP7eUzkZCYHE7Hj0pppLXFYhZ9Vl1IUQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHb8Nn1dlh3zYxkSjex+Q7OsLM1G2GbmcaiXZCnDb3nM0a4SIyoaGFSiYIYxkeGPwtp1mR3VXNn75ZXFNyk61b+gpqvIu8M4FcIH1+0EJLtfT8LtyO6OJ7GpESlqGbmec6y8qz8RXimuCZQ59vPdUdEn8f1RVUTSd+JRCm0YTOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JCDdv0I2; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JCDdv0I2"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b5fb2f7295so7370501cf.1
        for <linux-coco@lists.linux.dev>; Thu, 11 Sep 2025 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757598070; x=1758202870; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9qmtOM7dk27TAU4OyKZ0knJ4KFcYKzonTZZzmEGOvc=;
        b=JCDdv0I29Iygfi7PL5imBoxf3fWb8PUtoMirN1KWCE0vzOPVpZUPPX/B9eoJO+uDhz
         MAtBnrw2N8InidBB075/2wc9k8rwVpGtig6d538Nig8dlkaGVD8AUDpDKcF+oIz2CwVt
         SJPX3t4vUWzQSI22n4JwSAwzsRWYAcfekUrnMYoRpAYHIvELJ+CExY1qzgLu0vi4VIW0
         i77q62oGyMSRHyFVXs6vVUkGDs2ht04xcjh1GWTroGyFM7OyhRYkTnueMd2AmasjaPt7
         uVDctyI+1uhw6r6w2CZiOwVnpSSxQaC/onEOr/dDd2N9EE6AoOAPEmqyuOSDYA3eslu0
         efWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598070; x=1758202870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9qmtOM7dk27TAU4OyKZ0knJ4KFcYKzonTZZzmEGOvc=;
        b=Hyx+GwE+kwz4KmjWcWEQkt5h1GXbipTajkH+glWhy/7w+KcECXhtsfCLznzenFuu98
         21VvxilffJZ3Q4AiAMxYksDsLvpj2fsRhX5S7w0Iht6ZZF9seTEUOr/XFb0A9FY2sGhW
         g6d3oQvMeuHXvGXDVKLH8jNEQ5TRzEFUHHFoC/Ekf3nO87B/fUCsPrWhx8uFpRQRXekQ
         9L8jfI9Y5fY0A869INlLXAdktoTUfME/0MMgycQZfQmwYN1fWhk70VZ8bP2wxBbtDL5v
         r1RyK5bsM1oNl7g2V58ulL47on2P8RhjbV0xzvJ/Cpwjh14vewMTv5J5IzXk695kiIjZ
         c3JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxCC3gooi1h0GZvv7IvW1Q2DYh4Vitegp7dHeSqdU9gu1T9eTG3ZnArrgxSraSit/LkHL7HKYLJmGR@lists.linux.dev
X-Gm-Message-State: AOJu0YwP+HqzEXiyGVcnti8byCwaoc8Y/wRO79IKtvkGHTelM1lvkmtn
	MJNfSmGdZFbc6FLZh5IxIJSAJQKJcdTnEBchpRFAl50ax7RXwz0J4GKPXmh7X3gkGJ0=
X-Gm-Gg: ASbGncsDbmffWt6OBgeVFPhCcbWrI3JqsO2Ry5sEIFKuTHgQKoTnMxKgIL7jHUH2bso
	HfDjNN8EEOTgY8mf72ApsmlHhaYha335bNaGUl/Ry03WuAEsdIATaD/TcRVRqLBQGbGHhuj9Dnu
	oa5oUEfQnN3Dr4IB8yoewJYirliMU/pYkdycVNsCbu4/Qc1xUDP0xXce2aRMkbgeNg0FjpbFCCC
	MnebHMtAU4qB1d46eZducYzB71JLfI4sEVIMCKTQY9QI38BXXum9ZZ/Aenxzw5MT3sUTyzEkD/t
	2vswKPXt/tRWauoNAmcfpD1XcaqVler1fh8/ogSgs3XDUb8UPpc6wzxLeygc/BFGFZhc8VYHdEo
	AOq+2EtdCjHAEmDYPLR+BbsMvjORPLaccWAXjhrTzpBMjeA7BfsUdjnNs7ifmQ2kEZoaqit1M9l
	HFfII=
X-Google-Smtp-Source: AGHT+IG5BULuh1Ix3dTKx0dMR7o7+0XiARxVmRkjj0WGgmMyJMRjiHF7nh7Zr7cWchr7UEHaWH/u8g==
X-Received: by 2002:a05:622a:1214:b0:4b5:d932:15c6 with SMTP id d75a77b69052e-4b5f847fd1emr220313931cf.34.1757598070182;
        Thu, 11 Sep 2025 06:41:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820cd703f54sm102730285a.37.2025.09.11.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:41:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uwhXv-00000003zwM-3lhP;
	Thu, 11 Sep 2025 10:41:07 -0300
Date: Thu, 11 Sep 2025 10:41:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Arto Merilainen <amerilainen@nvidia.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, aik@amd.com, lukas@wunner.de,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev,
	linux-coco@lists.linux.dev
Subject: Re: [RFC PATCH v1 34/38] coco: guest: arm64: Validate mmio range
 found in the interface report
Message-ID: <20250911134107.GG882933@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-35-aneesh.kumar@kernel.org>
 <d57d12ce-78c6-4381-80eb-03e9e94f9903@nvidia.com>
 <c3291a06-1154-4c89-a77b-73e2a3ef61ee@nvidia.com>
 <yq5ay0ql364h.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ay0ql364h.fsf@kernel.org>

On Thu, Sep 11, 2025 at 11:03:50AM +0530, Aneesh Kumar K.V wrote:

> But we need to validate the interface report before accepting the device,
> and the device driver is only loaded after the device has been accepted.

+1

This must work from the generic OS code.

So I'd say add a new TSM op:
 int validate_pci_bar_range(struct pci_dev *pdev,
                            unsigned int bar_index, u64 tdisp_pa,
			    u64 size,phys_addr_t *bar_offset_out);

TSM has broadly two options to compute bar_offset_out:

1) Require the TDISP MMIO Offset is aligned to the BAR size and use
   something like:

    *bar_offset_out = (tdisp_pa) % pci_resource_len(pdev, bar_index);
    ipa = pci_resource_start(pdev, bar_index) + *bar_offset_out;
    if (size + *bar_offset_out > pci_resource_len(pdev, bar_index))
        return -EINVAL;
    tsm_call_to_validate(pdev, ipa, pa, size)

2) Require the TSM to convert the offest'd PA to the IPA:

    tsm_call_to_convert(pdev, pa, size, &ipa);

    if (ipa < pci_resource_start(pdev, bar_index) ||
        ipa >= pci_resource_end(pdev, bar_index) ||
        (ipa + size) > pci_resource_end(pdev, bar_index))
	return -EINVAL;

    *bar_offset_out = ipa -  pci_resource_start(pdev, bar_index);

Then the generic code builds a map of what parts of the BAR are secure
and what are not.

If it can't do either the TSM is unusable by Linux.

Jason
