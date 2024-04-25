Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E0336E
	for <linux-coco@lists.linux.dev>; Thu, 25 Apr 2024 00:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714004143; cv=none; b=H867xuU4Sxu28mtw6SWVlSGkJKkrqpxLux8cVb1fNEVk6nWsejNd/MJ9VNbNxAE6bvQ3Lj8wK+q41czqgE1AYBonVVfeU4UQdYehtsnMwC+bkUrgJadoFKKU5KpFud8B+cI4mRJOWNtGawsFR6KfL74nUKn7a3S5vR0Vo4CY0G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714004143; c=relaxed/simple;
	bh=AoCc2xRVw+eeSuN5RnnkMfbAOu6Mq8awkjYkscN3FUE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OuVIwZwvVT1kYGEKWzRzMN48n9XEsSJiysm0OCkkoHAdOWyt9pBE/xR7CP/eYL0qW0ATzua4V3hl1UQRP10ILpXX+U65irdAQ2d631VfBRW9qm7BBe08qL5NxMTRnn8BmYRQeq80w1KQ4A/JTGTrNCZIfrvYiD3N1TUBhF/lCLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YSkUY775; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YSkUY775"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5c65e666609so497937a12.1
        for <linux-coco@lists.linux.dev>; Wed, 24 Apr 2024 17:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714004142; x=1714608942; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=phUjQDDq8M6U9JQBTiJHu0B69Sr2zO6j83b67DrRLu8=;
        b=YSkUY775Dq05rSdEj9fE+EXkdGK6MWcesE8dLx9gWUPKmZBNlfzFas5xbamqWNcCOv
         xU+7MFPSb/GJT98aUeZ1F+7hWMvXD5ojedl/lyxND70HLin4CpNzI3yJLUXnUQXuu8e8
         FrHcM+YzL/gVaXbwedoLn5YJ+pvDV7c3mM/LOcWQVOKOjw9ynVqz4utv8hfOBwpgZbZJ
         VTJAUVbj9GzZCnsMIRRbzBb7RKzmqbTIUv7jUlgqAJ05JW9DPZER4nJVnhBF1Snlwlns
         CSzLcbiETpbYvL17z/izDjtMrIaCjkcybpT8AUzHLYYaOb9LIB857o/ePV0z76xvMeBJ
         Tekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714004142; x=1714608942;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phUjQDDq8M6U9JQBTiJHu0B69Sr2zO6j83b67DrRLu8=;
        b=g9+u6YtGMFEetP1obuuoBbI4Ol03mB4C3N2uimNUws5Zl0pDTKJR74CMWe67y6Ar8Z
         TxQyd3vYgFYBqMx3QV1Zsweiao8YPLoSvwPzHy0b7gG5mYmXiqak3ERHn5+ub5Sn6mvE
         plPVdHx+XvW45AW4T8swWpWzJM2o6hPwiRqrgpgHVUqKfeFDRFE5McGxmj5XEd15zYzS
         LvissmG1d35y9JkFzD5InuIml6e7IfuAj6X8CGEgyU6kZLlOzOn8Iut74L/LMA/RJOOb
         h3yvEzOmezG47SAj0icuzplP1Qg9tas0e51riQSZiU2aMvyx/m6odHJq+H6lx/0SX5lE
         fgHg==
X-Forwarded-Encrypted: i=1; AJvYcCVgYjgLOFrcChb8SukqP+SSXUqNqPrePDRqtrq2ndtwRdC2i1Y3Q0+hnYtMHQGwe384B2srUeJRTDNgUMy2FXA2a0dcZx4IQWitbQ==
X-Gm-Message-State: AOJu0YybOOb5ZHLpZz7JIR7JeHsyXgeK4ZFECThrmnp2MrMckC5c7xNt
	scGuDz8jz+k92KJETCwN9lXCvNKYHy1/Ay1rcCuXEUyCj6SZZJn3vdcya6L9ISrC9Wg05jlSsQ5
	FYw==
X-Google-Smtp-Source: AGHT+IFpMCiw3G/yjKQSya55GEaNi7BT0tDLkwsfoAUywNRODVW0WdG85voz0VSIDV0w8EcxGv/B7fSOJOw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:674d:0:b0:5cd:9ea4:c99 with SMTP id
 c13-20020a65674d000000b005cd9ea40c99mr16727pgu.6.1714004141606; Wed, 24 Apr
 2024 17:15:41 -0700 (PDT)
Date: Wed, 24 Apr 2024 17:15:40 -0700
In-Reply-To: <20240421180122.1650812-22-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240421180122.1650812-1-michael.roth@amd.com> <20240421180122.1650812-22-michael.roth@amd.com>
Message-ID: <ZimgrDQ_j2QTM6s5@google.com>
Subject: Re: [PATCH v14 21/22] crypto: ccp: Add the SNP_{PAUSE,RESUME}_ATTESTATION
 commands
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com
Content-Type: text/plain; charset="us-ascii"

On Sun, Apr 21, 2024, Michael Roth wrote:
> These commands can be used to pause servicing of guest attestation
> requests. This useful when updating the reported TCB or signing key with
> commands such as SNP_SET_CONFIG/SNP_COMMIT/SNP_VLEK_LOAD, since they may
> in turn require updates to userspace-supplied certificates, and if an
> attestation request happens to be in-flight at the time those updates
> are occurring there is potential for a guest to receive a certificate
> blob that is out of sync with the effective signing key for the
> attestation report.
> 
> These interfaces also provide some versatility with how similar
> firmware/certificate update activities can be handled in the future.

Wait, IIUC, this is using the kernel to get two userspace components to not
stomp over each other.   Why is this the kernel's problem to solve?
