Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0257738F232
	for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 13:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772027726; cv=none; b=ZNM/RyDKlqsrfyeSFxAvMnjiGWd7UtlCe/y5aXUcynLAyIrDLzp3r02J0r7foFjZh4O/K8TLukNIQzz0/4wcjM+gyNy9d21ij9H3EpKJ57luYGkiNZkTt3VaM9S8rhOb7bqrr6VmCFTaWeQYKYPB/p+VDoKERajRY6zjpc5Vwh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772027726; c=relaxed/simple;
	bh=j8QD+YOKTudOlbEWjrHGAEdh2xgoRTUdHV6Nf6Pmn5U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=asDpk21VIl/VaO4dF4wy+HmyzkCMl3ftiU6wJsDIWijRJ/sz206EpCWgMP+pK5UL6feNiAh+Y4Wn+eaOSBYTt5ruGsZ+q/OUigjSy6oHCg8rVXaQ4IM8dUKkgAeW/sNo1aWzlOMvb0ruUfFCnnDKaYGVqTW6mMQLCqbCWHTIbWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DS2dKdsU; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DS2dKdsU"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3545b891dd1so38131024a91.1
        for <linux-coco@lists.linux.dev>; Wed, 25 Feb 2026 05:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772027724; x=1772632524; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hj5kWs8x13Nc52H5YwkoGAX7bER0Qj5o5LwtSPL8HY8=;
        b=DS2dKdsUjm0MVmeD9nNNxBtflBOUj7LZklLJbyMgyZnTpKnA9CTYDgJJ7F2lMtxL7/
         RtuvAvfY5XRQ/I5PySPbWGyF9GAV+LsgQxsQHLEzC2g0mqbyUr2y8fJMSxPhutai5rYM
         +TXv2Sz8NUWXPJGQx3xAVJAEkpogaQ43twP0dTMqelUTp2p9k4p0rsNxklKxW01UmVVe
         9TOIk5RPGEq/ud+yfUkSEvC1LWUnBQQPeedyt21iM9SMlqNpPsYKcjGzw2H5LLQqwnUW
         6Dd3bfTkttv7wj96pARQxrCiA/HP71jOTRSHeXTeK6dNKxOY8N/IOqwnVnNrWhGZ4LWv
         SnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772027724; x=1772632524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hj5kWs8x13Nc52H5YwkoGAX7bER0Qj5o5LwtSPL8HY8=;
        b=fZZWJJyNBBPhtuN7XbR+zcI8j108INXuqOwFz1neDAYoMKotD79w+B5kuzXJlEIFXr
         wbMOXj5VnwyLQCy9sMiU8ckdL7ktlMWou5mO51hLdHMpxBeBijF30tarfvScACRfCEyz
         MblnMFPY0mS8uk3zp6IHrBJjZ0+xnJQFIzGhTOxyxT0LulbImi5awD7y8azOThgQFI3v
         D5YZkoODkCelgXoTcxQfERMVxpG3AyhdhVpVQQbn7bWFs8eGQgJ0ywwZLU6Ra+W0/chX
         +EjPH+94BwIe+msMb/UIcS45fiibstaYeq6+b496Mg0+1WIrgepx+HLpVxZRa1S9J+tQ
         GhsA==
X-Forwarded-Encrypted: i=1; AJvYcCX+2ffpeV+4WknEsjTzzm1DCOBgLTJSE0v/EkjdMTfPnpp15jOyONTOLb2kJ93sedzStktoUMH2NKQ6@lists.linux.dev
X-Gm-Message-State: AOJu0YyA6iPwgLh9QquQwhaLCSwxc6mCb//TtqPGf7irPgTnEshlsjqp
	CTMsGb3Z97VePloCh20sumkvCX4jk/a7LcN19qIHeIa7W18DEMP0bXtlallmisWjLyfTQSqdoDZ
	lXxlHhQ==
X-Received: from pjbee5.prod.google.com ([2002:a17:90a:fc45:b0:34f:96fa:45e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3147:b0:354:a065:ec3b
 with SMTP id 98e67ed59e1d1-358ae8d5edbmr14072256a91.27.1772027724097; Wed, 25
 Feb 2026 05:55:24 -0800 (PST)
Date: Wed, 25 Feb 2026 05:55:22 -0800
In-Reply-To: <20260225075211.3353194-1-aik@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260225075211.3353194-1-aik@amd.com>
Message-ID: <aZ7-tTpobKiCFT5L@google.com>
Subject: Re: [RFC PATCH kernel] iommufd: Allow mapping from KVM's guest_memfd
From: Sean Christopherson <seanjc@google.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Steve Sistare <steven.sistare@oracle.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev, linux-coco@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, Santosh Shukla <santosh.shukla@amd.com>, 
	"Pratik R . Sampat" <prsampat@amd.com>, Ackerley Tng <ackerleytng@google.com>, Fuad Tabba <tabba@google.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 25, 2026, Alexey Kardashevskiy wrote:
> For the new guest_memfd type, no additional reference is taken as
> pinning is guaranteed by the KVM guest_memfd library.
> 
> There is no KVM-GMEMFD->IOMMUFD direct notification mechanism as
> the assumption is that:
> 1) page stage change events will be handled by VMM which is going
> to call IOMMUFD to remap pages;
> 2) shrinking GMEMFD equals to VM memory unplug and VMM is going to
> handle it.

The VMM is outside of the kernel's effective TCB.  Assuming the VMM will always
do the right thing is a non-starter.
