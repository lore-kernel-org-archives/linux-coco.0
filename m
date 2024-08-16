Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9514B1BC9E7
	for <linux-coco@lists.linux.dev>; Fri, 16 Aug 2024 21:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723845505; cv=none; b=TNU6WA94sfcWTQJqiMqaQw9fvbJYYLWxcxsY9njMyFOCFEGKsxJAp8Qw45JZnvfljcldqDOT701zGxc+/2Pp1KcWsPRsuOvAKhZti7SUmE464t6UmpNetS7TGK6MC4s/W6EgMXGRhuZ7UkmBBfAf9W7uC+EcxfstC140hTkBAlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723845505; c=relaxed/simple;
	bh=g0F/sd95+BjyUwrTk3+Pt47OK1/UutxibFLk9BmEr4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Em/gUQ5MzpfvycRg2qRX7d73/eiwnE0Rm8mUcdvN1RNvIloOist2OXgVIvq09RpF76g/Q9OPveFhwBY1WLnNf20Zmm44MbyIEiqrAwptVWIMWAmJTen6rjMz81ONMrLZ85nF7MLnJ8UdHXl8hygeKgijLSce7/Da3zeiD3MGSYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HNz0JXMr; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HNz0JXMr"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52efdf02d13so3901661e87.2
        for <linux-coco@lists.linux.dev>; Fri, 16 Aug 2024 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723845502; x=1724450302; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vyAQI0mLIme3ritjMf52b0imeC+VEqOt65MTNAtgvRU=;
        b=HNz0JXMrYDq9p0auiHe0u4Lt78lviVBTB3r/4TgVHVPPZY69r3D3lCskXKNAqHn85l
         iXq7gU9VNxvBgy/t+BP7LTK+9wHGVF0usPAa7//Ns0JroJnqr+O2Nl+cOloX++WuxZn4
         P244SFUPVyGVZltv+IxV4WQEZsLJxLTaWYd3Te6ReMJjqOVRIsfKIJA+b7oLt0evj4/d
         EdoPj8UnRUOdNB5gNk+xyURG4NklQ+igrK0CJksJKjyrSc7vvAQ7dbskpWy2cTzVGcSp
         gKoSmbM+ldJzmptXuJE0P/o2b5Yw/DcIUBR9pvW8VtoLLPiZQlQeSahADCYOXmcZl2yu
         qMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723845502; x=1724450302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyAQI0mLIme3ritjMf52b0imeC+VEqOt65MTNAtgvRU=;
        b=E1nLjOYAfo7xLj2poXbkRdZerfaH1bm2e/w9FkwZ+2kWmGg6508owZ0jOSlVPm9whN
         TlqL8s4hQea44uQSzE0jM7BtD5v/O0phu8u4bLGIADpZzndYlHonpGvO7GDEjzmdCkvu
         qWJMMyOhXrKJFqr8nVBhSRTzZznQo8N3YRVNjE1e17vkxY4NGjDC7Skw7UzAvYpDrtSX
         U8atFOiFcUMIYo6FaxTciwKmDSVwA5o8+BrzpeXVBUf9EWHL1r1k+A+0YLKVuaH5b6Zl
         v6DvIFMumdPVOEMyfLF7qeWQXXpCHgJBlgCGsZ0DQehs4ZGTMD7PL285tFk3YMKANlsX
         UNAg==
X-Forwarded-Encrypted: i=1; AJvYcCVkqc5wJUBF+xc9KN8yc9TlJNkPs35IUVZU61s8wGExK08kOWcBM9ribwbb8mrccgNtoCvRAkuQb+Z7juTdzWRmia+aQ8NvcwdBTQ==
X-Gm-Message-State: AOJu0YwZTqxt8gk/pu3/1wvjK5BJZsIr53b5vPrXx1XyxvNxX9Mnrcou
	EO6FbT+9UDKLchJP0vCNdHPbC1VgVDu3W1St9wmKgi1pna3kaCWqK+qPMjQP9d76VfAHNYo8iGP
	OgF003soYeTTXm84f9Jxyu0+O898zB7W9AwHo
X-Google-Smtp-Source: AGHT+IE3OGYvE2Lmfx5P1zwYegVYlgr1AuU2FCcSFUysvWMVPGL4hd0/zjoroW1fldq0JWzGDaAIAmG9Jq4zoll+/tc=
X-Received: by 2002:a05:6512:238f:b0:52e:9808:3f48 with SMTP id
 2adb3069b0e04-5331c6aee2cmr3903167e87.21.1723845501250; Fri, 16 Aug 2024
 14:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZkN25BPuLtTUmDKk@google.com> <20240515012552.801134-1-michael.roth@amd.com>
 <CAAH4kHb03Una2kcvyC3W=1ZfANBWF_7a7zsSmWhr_r9g3rCDZw@mail.gmail.com>
In-Reply-To: <CAAH4kHb03Una2kcvyC3W=1ZfANBWF_7a7zsSmWhr_r9g3rCDZw@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 16 Aug 2024 14:58:10 -0700
Message-ID: <CAAH4kHaCGraqmD8Zi6CtFzYFBvg5vgaQEc_DYJ7PayONp22B-w@mail.gmail.com>
Subject: Re: [PATCH] KVM: SEV: Replace KVM_EXIT_VMGEXIT with KVM_EXIT_SNP_REQ_CERTS
To: Michael Roth <michael.roth@amd.com>
Cc: seanjc@google.com, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	pbonzini@redhat.com, vkuznets@redhat.com, jmattson@google.com, 
	luto@kernel.org, dave.hansen@linux.intel.com, slp@redhat.com, 
	pgonda@google.com, peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, papaluri@amd.com
Content-Type: text/plain; charset="UTF-8"

> How do we avoid this?
> 1. We can advise that the guest parses the certificate and the
> attestation report to determine if their TCBs match expectations and
> retry if they're different because of a bad luck data race.
> 2. We can add a new global lock that KVM holds from CCP similar to
> sev_cmd_lock to sequentialize req_certs, attestation reports, and
> SNP_COMMIT. KVM releases the lock before returning to the guest.
>   SNP_COMMIT must now hold this lock before attempting to grab the sev_cmd_lock.
>
> I think probably 2 is better.
>

Actually no, we shouldn't hold a global lock and only release it if
user space returns to KVM in a specific way, unless we can ensure it
will be unlocked safely on fd close.

-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
