Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF9F622
	for <linux-coco@lists.linux.dev>; Sat, 18 Mar 2023 05:13:25 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id le6so7373637plb.12
        for <linux-coco@lists.linux.dev>; Fri, 17 Mar 2023 22:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679116404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp4nrXm1X0DRjVSq3iwlTb4e7n7mV7oF4ktjLlYr7kI=;
        b=bLjj9lGgZpmi+5FdHB64/F5xCOboYww86flECThggnpLYmZZA5HqQTRQcFCfg+10a9
         gaz0V+wmOBm7A4cV7oLOCRDbxttum/0tzDarTuJxSZ6b0oQFZkkdZCaIn52+gfS9b2Yf
         ts32C0rszSNrP3uxXG8IdM/ODszWZAHT7PALtVns+aiy/RgUeeDJACOY+FyFgOggJsCW
         3jmRnpxXRZt66+1XPq+2yFozVuTkCwGg+SKIJkvcZ+kSuSwAEGRfREOmD8Z3OMxHC6Wp
         ED2E75u8Bob8l5+LtugWgjavAYlz579OG/4/c6aVO+NkY3Xv6UcxQ0mOKdJ/I/g3GwRF
         Zcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679116404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vp4nrXm1X0DRjVSq3iwlTb4e7n7mV7oF4ktjLlYr7kI=;
        b=KvOW+ToF7olAqe2jhu2ItfckzpySnJ076N5F/uM8O7ShNrVJSPThnmM4RhTzwP6Jvc
         2e3f/9nruasTBdRR5zcH+/v8zUw3X4neFb1am+Kn7p1xs9tjgtn/xlzXqhsieiXMW0ue
         JfE4F+jEbrogF/MFce70CzbMVI4xldzAp8200Q7ewIE6sF6PLi4DydB+I0dLJt8eWSSd
         AzlsCYCwXzfBy7FbOddkSczVVb01+OiTRqQQfuT8u/TPjelxT5kO/ek+0S+lR18nEVjA
         YHOtNq8/OLGegJEVLlVUo+HCZvTmXh6oDhH5PLjKa98WZ5j49lCKNkUBkLCaDHGOYYu3
         uKHA==
X-Gm-Message-State: AO0yUKU7QmWiA0Hz+BqsTPAs3nsweR+pWFjC8Taz5Yx1OEMUFV1lbNYy
	ncUF8P7wyfrjjDo5TJreL2o=
X-Google-Smtp-Source: AK7set/soYLT1CHxH7Zm0HB+kkpyXNgNLr1rZsO1BZXpOWuxHpdfWc2Pxx1BGwMWxRV9sT22pll0Hw==
X-Received: by 2002:a17:903:1d0:b0:19d:1d32:fc7 with SMTP id e16-20020a17090301d000b0019d1d320fc7mr11937833plh.51.1679116404399;
        Fri, 17 Mar 2023 22:13:24 -0700 (PDT)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902b11400b0019251e959b1sm2350530plr.262.2023.03.17.22.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 22:13:23 -0700 (PDT)
Date: Fri, 17 Mar 2023 22:13:22 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org,
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com,
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com,
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com,
	bp@alien8.de, vbabka@suse.cz, kirill@shutemov.name,
	ak@linux.intel.com, tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com,
	dgilbert@redhat.com, jarkko@kernel.org, ashish.kalra@amd.com,
	nikunj.dadhania@amd.com, isaku.yamahata@gmail.com
Subject: Re: [PATCH RFC v8 03/56] KVM: x86: Add platform hooks for private
 memory invalidations
Message-ID: <20230318051322.GF408922@ls.amr.corp.intel.com>
References: <20230220183847.59159-1-michael.roth@amd.com>
 <20230220183847.59159-4-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230220183847.59159-4-michael.roth@amd.com>

On Mon, Feb 20, 2023 at 12:37:54PM -0600,
Michael Roth <michael.roth@amd.com> wrote:

> In some cases, like with SEV-SNP, guest memory needs to be updated in a
> platform-specific manner before it can be safely freed back to the host.
> Add hooks to wire up handling of this sort to the invalidation notifiers
> for restricted memory.
> 
> Also issue invalidations of all allocated pages during notifier/memslot
> unbinding so that the pages are not left in an unusable state when
> they eventually get freed back to the host upon FD release.

I'm just curios. Could you please elaborate?
Unbind is happen only when memory slot is delete or vm is destroyed.  In the
case of memory slot deletion, the gpa region is zapped via
kvm_arch_commit_memory_region().  In the case of VM destroy, we have
kvm_flush_shadow_all() which calls
kvm_arch_flush_shadow_all() =>kvm_mmu_zap_all().  Doesn't it work?

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
