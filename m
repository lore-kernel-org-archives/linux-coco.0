Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A86B3C0B
	for <linux-coco@lists.linux.dev>; Mon,  9 Jan 2023 16:55:39 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so13456318pjq.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Jan 2023 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=81sjJWzHO6Ovjo5Gl60AAk0+/2Zuzb6zOrT24WH6r3o=;
        b=OOJuw8OWU9nGb+CL4TUgcpiaj0SA2J1CLUj7NLENcLFdDRo7NoHkTYncpkkO8iVYRl
         74LR+OZkKxRfS5/+S70XDs2suGpDD6t9Hkh0kUhKuWlV9iwZpbsPPDe3G2gtcCd3m4nw
         jkzOl8rELfTy/SlBdk23Ea03QIoTSoMfnf+EXS6eQOBKw7jDv0FTj3yFjQUvJjfapk4T
         kf0Zy5ZqxRUUFZpsVxuA5H0Hw8apONfzLomEcmRWF/IHy93TJuSvzGiXQ8CJ/tb6x6h9
         egX2evheI9vwF5TD/jWWy9FQg5kL0XyYYoEFICAoU2fjCkLhF9MUnLleCSPuBSDqBe0M
         DX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81sjJWzHO6Ovjo5Gl60AAk0+/2Zuzb6zOrT24WH6r3o=;
        b=Z8M1jLXYla3cRf6QFKxJSytgQwfiQF+tXCBqw2EnjPONTqOP98wV/XtcTpt9Gba4Fm
         oRvKWcsNrlL1mPVQrW9tCs4uJavws9qjBy983Uuh0oVZRFc8JfJW2dvvFxjHMtyeWgsS
         Ef8klPHVIZxP0Kn7hBweTQ2MuWLoBbL5v3bsQgCwYi/Pbvwx7dwq9EieJVgHMUR7cjhz
         5RiSj1nms0B6pB1PBnjOMTXXokd4lE6Hmz57lm0I8maMm4Txrzi6nzlcQxHbrDbjdyeO
         taRZz7yE2GFOY68iS8nIQ9wzjQW52dzVD4+tY/b+zV+8a1nmtYCJKimGvCBqAbvqnRqf
         wOXw==
X-Gm-Message-State: AFqh2krc2uk0oA5MuiqeDpyyfdlYTXEDhw/CHfjOlB/h4mbfc9H/trtB
	zirHwYQyiuZGsPE5EesY5tQkdmrtNeCpurV3peOhOg==
X-Google-Smtp-Source: AMrXdXsPdoZHVqBzLP7WRcXcNC4Xd6GTdeUcwaefhv8fy9Lwb6M6BmFfgkXiH/ADLsV/yr8LRaT3J6DHlJCmHzvZGPY=
X-Received: by 2002:a17:902:82cb:b0:192:a04b:c624 with SMTP id
 u11-20020a17090282cb00b00192a04bc624mr2581882plz.134.1673283338843; Mon, 09
 Jan 2023 08:55:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221214194056.161492-1-michael.roth@amd.com> <20221214194056.161492-63-michael.roth@amd.com>
 <1c02cc0d-9f0c-cf4a-b012-9932f551dd83@linux.ibm.com>
In-Reply-To: <1c02cc0d-9f0c-cf4a-b012-9932f551dd83@linux.ibm.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 9 Jan 2023 08:55:27 -0800
Message-ID: <CAAH4kHbhFezeY3D_qoMQBLuFzWNDQF2YLQ-FW_dp5itHShKUWw@mail.gmail.com>
Subject: Re: [PATCH RFC v7 62/64] x86/sev: Add KVM commands for instance certs
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com, 
	wanpengli@tencent.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz, 
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org, 
	ashish.kalra@amd.com, harald@profian.com
Content-Type: text/plain; charset="UTF-8"

> > +
> > +static int snp_set_instance_certs(struct kvm *kvm, struct kvm_sev_cmd *argp)
> > +{
> [...]
>
> Here we set the length to the page-aligned value, but we copy only
> params.cert_len bytes.  If there are two subsequent
> snp_set_instance_certs() calls where the second one has a shorter
> length, we might "keep" some leftover bytes from the first call.
>
> Consider:
> 1. snp_set_instance_certs(certs_addr point to "AAA...", certs_len=8192)
> 2. snp_set_instance_certs(certs_addr point to "BBB...", certs_len=4097)
>
> If I understand correctly, on the second call we'll copy 4097 "BBB..."
> bytes into the to_certs buffer, but length will be (4096 + PAGE_SIZE -
> 1) & PAGE_MASK which will be 8192.
>
> Later when fetching the certs (for the extended report or in
> snp_get_instance_certs()) the user will get a buffer of 8192 bytes
> filled with 4097 BBBs and 4095 leftover AAAs.
>
> Maybe zero sev->snp_certs_data entirely before writing to it?
>

Yes, I agree it should be zeroed, at least if the previous length is
greater than the new length. Good catch.


> Related question (not only for this patch) regarding snp_certs_data
> (host or per-instance): why is its size page-aligned at all? why is it
> limited by 16KB or 20KB? If I understand correctly, for SNP, this buffer
> is never sent to the PSP.
>

The buffer is meant to be copied into the guest driver following the
GHCB extended guest request protocol. The data to copy back are
expected to be in 4K page granularity.

> [...]
> >
> > -#define SEV_FW_BLOB_MAX_SIZE 0x4000  /* 16KB */
> > +#define SEV_FW_BLOB_MAX_SIZE 0x5000  /* 20KB */
> >
>
> This has effects in drivers/crypto/ccp/sev-dev.c
>                                                                (for
> example in alloc_snp_host_map).  Is that OK?
>

No, this was a mistake of mine because I was using a bloated data
encoding that needed 5 pages for the GUID table plus 4 small
certificates. I've since fixed that in our user space code.
We shouldn't change this size and instead wait for a better size
negotiation protocol between the guest and host to avoid this awkward
hard-coding.


-- 
-Dionna Glaze, PhD (she/her)
