Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9D3DDB5
	for <linux-coco@lists.linux.dev>; Thu, 24 Aug 2023 15:54:25 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1692892145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=km71JZdPEneG2hyb5yjpKibchTWDGBjqCksdxoHBWus=;
	b=pEVOz96ceBu2FdCJll9tSqYX+nK/THiLfa9PjpotPw7A3ANHjaBjsjZyOiZ84Nnonc9q+K
	zs/eF2icRGJjQ4T0D6PAm+R94Fhumr7L2cQgJ7a0uITDYfwf/QuI91QRe/nGrVfs8pLWr1
	aKSsljIHVDAdkoluJOgqP7ink8YK+Ky1JON1+d0afXvsNtd/0UuIVudTILgkrda8Z06igh
	R9ND9k/My8IMFFc+eIeHa9Thw6P6PAtxicEBOTdA4N4wGBh3AD5GpYT/6fkuboMir2IaWk
	SHDmr4DeS3BlaJlKKianq7Cio4XQatopWJRe6cg7j2WbeKiqf8N/Fhx+hP7opw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1692892145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=km71JZdPEneG2hyb5yjpKibchTWDGBjqCksdxoHBWus=;
	b=AFYl1uaN2QcvqPzOgyJwUtVz1nHiB7tpKSWhiI3j1/SdycnZlEwYABrKkNhB4TqOTN5aBj
	dmBmMgfgzGdDIwDA==
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen
 <dave.hansen@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima
 <jun.nakajima@intel.com>, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/tdx: Mark TSC reliable
In-Reply-To: <20230808200111.nz74tmschph435ri@box>
References: <20230808162320.27297-1-kirill.shutemov@linux.intel.com>
 <ecc11d54-6aaa-f755-9436-ae15b94fb627@intel.com>
 <20230808200111.nz74tmschph435ri@box>
Date: Thu, 24 Aug 2023 17:49:05 +0200
Message-ID: <87bkewcufi.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Aug 08 2023 at 23:01, Kirill A. Shutemov wrote:
> On Tue, Aug 08, 2023 at 10:13:05AM -0700, Dave Hansen wrote:
>> I take it this is carved in stone in the TDX specs somewhere.  A
>> reference would be nice.
>
> TDX Module 1.0 spec:
>
> 	5.3.5. Time Stamp Counter (TSC)
>
> 	TDX provides a trusted virtual TSC to the guest TDs. TSC value is
> 	monotonously incrementing, starting from 0 on TD initialization by the
> 	host VMM. The deviation between virtual TSC values read by each VCPU is
> 	small.

Nice weasel wording. What's the definition of "small"?

Any OS needs a guarantee that vCPUs cannot observe time going backwards,
which is obviously possible when the deviation is not small enough.

> Wording in the spec looks okay to me. We can only hope that implementation
> going to be sane.

Hope dies last :)
