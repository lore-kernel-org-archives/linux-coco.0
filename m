Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ABE27A137
	for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230074; cv=none; b=lf+J+ZdiSajxfQ2Rkl6zR9k0+xdZqGk9ClORCjmXvEz9422IaLBqNfIPnUnC0tjWEAdKYshCoTQ6P+fyZGeodwxZpwlOtOw0WW7BEL60cuP07X+ko+sOh+cE2KyMjuPthRb3f8pe4ohmBbZP1sk1a8UTL3We6YJE+qUQAPNT1A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230074; c=relaxed/simple;
	bh=QdpEPJ8gEYzpOoGgSc70hLnLhxzBAJR+99wYqefKZis=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ONrt8vc8tJnuMi2eRigHUr8EtT1pLey+2n30oyfz1hkrSEm3WBnrSBfY24yNQLwIHBCt5n4U9AVMXsGgZVGI8DFdZU0foFua8Iv5p0QBs8NCClSV1dt9fRoE+QccvBC/5RcyqnyPc15ml9LQ8feJQ0znU1WTwbEiSE6eKZLrF4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cgLkbsex; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cgLkbsex"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30a96aca21eso6960502a91.2
        for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747230072; x=1747834872; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYjVSGsMHKEcRuY737iQ9jOd94jFmJlbiKkyJxWPX0o=;
        b=cgLkbsex9EeDckUPAwA0TAdMieH3SoCx4cVg2JLOsP6YaLERNn0pTsKMn69nuXNew5
         vVaIlX52rYgudVSxVsFCdYvPcaLQk8UlZt7iF1CyZCsDq7HkXkjhxdUir3jbe+a3OtID
         WjAWJKOD4BXubO8np91wCEmYEEUcsAey7enYFP83/ghGout2JnkI1NKNrXlsAMfK5NgS
         onA3Pno7zXfXvda/AfYNl9WClJs/uRRhH7C76gPzZNiLe8XC9j/WZK/UjpY11vy+WTut
         48EPUscCPAUtfg1Q1laspvJ4A54aUl80HiRJImQgdA72rwKZtO+kN+ilip0AejfJndsr
         WMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230072; x=1747834872;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYjVSGsMHKEcRuY737iQ9jOd94jFmJlbiKkyJxWPX0o=;
        b=WRGi7DiXNZqQalQfao0vo2iM1ijLF89kiap2KjCP7+MmCwtBkrcaiais7Ulat8YA5i
         kD/GEn931/qLUra8BL+jz6XQ6oDHKWpJi17ENUTBDsZW202xwk41w0MKp8Bduw45Dq5O
         fMJmBg2CAMFeI7Ok3Aubr8+lIXK0vfPhPkwU3inBS/bw0TZnXcD1d1IuPADmheV99qhx
         OKD+S8Ou3jGFk00jxqSbSwIBj39zGP2S2ClVMBwl1qJyF3taZiLg3+SrA7eZ5CQLXaN8
         AZ3wQPOf9SiEocKFTV4HJVFAgwKTETgGVegVC9quBEe2KKeLeTXKgOs7PaxH3qlkE30Q
         FIUg==
X-Forwarded-Encrypted: i=1; AJvYcCUpYQqO1TR09rHbPI09B1xPWrTj2jaOoH4lfk5rtohavKO8H78PbI2P6RIsfS1/Xa+4EYbG5/HLioOL@lists.linux.dev
X-Gm-Message-State: AOJu0YwSOJ+ZUzaMYEoKuQOdDk8/t0J/zuJbPSoaLvgurToaVJzaSkcI
	HwubPAwxaR0oJDTOY4ip+i0+/MIFGM7AslrAEWllheBiI+al0RlP67wpu+OtyILTpHvw/qbVg8u
	/tQ==
X-Google-Smtp-Source: AGHT+IErt22KB6Bdmg93RK4s626ZQgvKZVAsGQc1try2WwfIQuCLiAkCsQttfSHfUk5K1Biq89347r4kD1I=
X-Received: from pjbsy6.prod.google.com ([2002:a17:90b:2d06:b0:2e0:915d:d594])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51c5:b0:308:6d7a:5d30
 with SMTP id 98e67ed59e1d1-30e2e5c9248mr6985235a91.18.1747230072267; Wed, 14
 May 2025 06:41:12 -0700 (PDT)
Date: Wed, 14 May 2025 06:41:10 -0700
In-Reply-To: <20250502130828.4071412-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250502130828.4071412-1-kirill.shutemov@linux.intel.com>
Message-ID: <aCSddrn7D4J-9iUU@google.com>
Subject: Re: [RFC, PATCH 00/12] TDX: Enable Dynamic PAMT
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: pbonzini@redhat.com, rick.p.edgecombe@intel.com, isaku.yamahata@intel.com, 
	kai.huang@intel.com, yan.y.zhao@intel.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 02, 2025, Kirill A. Shutemov wrote:
> This RFC patchset enables Dynamic PAMT in TDX. It is not intended to be
> applied, but rather to receive early feedback on the feature design and
> enabling.

In that case, please describe the design, and specifically *why* you chose this
particular design, along with the constraints and rules of dynamic PAMTs that
led to that decision.  It would also be very helpful to know what options you
considered and discarded, so that others don't waste time coming up with solutions
that you already rejected.

> >From our perspective, this feature has a lower priority compared to huge
> page support. I will rebase this patchset on top of Yan's huge page
> enabling at a later time, as it requires additional work.
> 
> Any feedback is welcome. We are open to ideas.
> 
> =========================================================================
> 
> The Physical Address Metadata Table (PAMT) holds TDX metadata for
> physical memory and must be allocated by the kernel during TDX module
> initialization.
> 
> The exact size of the required PAMT memory is determined by the TDX
> module and may vary between TDX module versions, but currently it is
> approximately 0.4% of the system memory. This is a significant
> commitment, especially if it is not known upfront whether the machine
> will run any TDX guests.
> 
> The Dynamic PAMT feature reduces static PAMT allocations. PAMT_1G and
> PAMT_2M levels are still allocated on TDX module initialization, but the
> PAMT_4K level is allocated dynamically, reducing static allocations to
> approximately 0.004% of the system memory.
> 
> PAMT memory is dynamically allocated as pages gain TDX protections.
> It is reclaimed when TDX protections have been removed from all
> pages in a contiguous area.
