Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D033C1
	for <linux-coco@lists.linux.dev>; Mon, 21 Feb 2022 17:40:27 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id f11so7955669ljq.11
        for <linux-coco@lists.linux.dev>; Mon, 21 Feb 2022 09:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xEuyjFrM9XwMrClBWbdS/xCWNoJfoXGzRHNpn8EHVe8=;
        b=EvNZ4JN1PESakWqiNhVErkDTF8azxH7NkFupvW940zHErR8fbltkz8fMM3erSSAkua
         SVbCJAx5x99BdcVvfCbuOi6eihjGnlTLy32uvWD8S02HQh5C6ntMJgadw9JJD95XWSe6
         FYzVQ3ZEYFWfNS89g5hsLbaL7gMl81XsfzVoLPHnM9uLGNjC7SYyyUsU2Qwm8B1zZjsQ
         opiHv5yc1+vfHrioBcT0Su4bI0Uo1cnoWi2VTaIof4su3DEprcGE3luxKhgjxtku3cgW
         c2nbRU/0MTpXeAhcfUwbGoQnEXkyZAFRlK6RJqkkSBHexXVWxzj39goDYznkCJbICaie
         0Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xEuyjFrM9XwMrClBWbdS/xCWNoJfoXGzRHNpn8EHVe8=;
        b=elTGETJipI4E/+uqpCS/iFPkLU64xoLVq1GO+TnkVFrFJcFd+GsZmBL+1eQHuQVIHJ
         8p2A9EZH1aJgTzDkL9XNcozZWgXxCfTNdmPuSpLKnQhOtFCIRI7XT9bmBzlgfs1donBS
         3AEwPgl737GCxoebb/Jn8sqhX0vLHbUMBajIGh75ovGVYJAiTHFTJTKmmZWAH7jTXQ7Z
         0F/Z2WNxOBwJs/FGP6+Wx9tC1e4Bz0ZfziE4QjlzwaDXqlgVQVAc+m2HkyKXOpO9/+0r
         ualhnOsKpJ0eNTgxz1kd0J2czq5LsIIKyzYOubXATvUpPyu2NZY5Wj2RjaTkMNacH/FZ
         mtIQ==
X-Gm-Message-State: AOAM532hjcqFAIzHIOVGoooPZ7D4zuTD+wKwUMbdDVvWk17/P+7QXbhk
	hlqDeXpr6oUtCAuPcxFY3YzUow==
X-Google-Smtp-Source: ABdhPJyMpVcgpGjVDM1tE/A1ztFlJLD5B8plNpKCAvS4oAZ2w0SyAG5LTlNyt81HXrIEaGhcKYOhLA==
X-Received: by 2002:a2e:a4ae:0:b0:244:dac8:4590 with SMTP id g14-20020a2ea4ae000000b00244dac84590mr8981123ljm.231.1645465224829;
        Mon, 21 Feb 2022 09:40:24 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id v18sm1417023ljb.98.2022.02.21.09.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 09:40:24 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
	id 748CC1039EE; Mon, 21 Feb 2022 20:41:21 +0300 (+03)
Date: Mon, 21 Feb 2022 20:41:21 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>, Andi Kleen <ak@linux.intel.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	brijesh.ksingh@gmail.com, tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH v10 21/45] x86/mm: Add support to validate memory when
 changing C-bit
Message-ID: <20220221174121.ceeplpoaz63q72kv@box>
References: <Ygz88uacbwuTTNat@zn.tnic.mbx>
 <20220216160457.1748381-1-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216160457.1748381-1-brijesh.singh@amd.com>

On Wed, Feb 16, 2022 at 10:04:57AM -0600, Brijesh Singh wrote:
> @@ -287,6 +301,7 @@ struct x86_platform_ops {
>  	struct x86_legacy_features legacy;
>  	void (*set_legacy_features)(void);
>  	struct x86_hyper_runtime hyper;
> +	struct x86_guest guest;
>  };

I used 'cc' instead of 'guest'. 'guest' looks too generic.

Also, I'm not sure why not to use pointer to ops struct instead of stroing
them directly in x86_platform. Yes, it is consistent with 'hyper', but I
don't see it as a strong argument.

>  
> index b4072115c8ef..a55477a6e578 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -2012,8 +2012,15 @@ static int __set_memory_enc_pgtable(unsigned long addr, int numpages, bool enc)
>  	 */
>  	cpa_flush(&cpa, !this_cpu_has(X86_FEATURE_SME_COHERENT));
>  
> +	/* Notify HV that we are about to set/clr encryption attribute. */
> +	x86_platform.guest.enc_status_change_prepare(addr, numpages, enc);
> +
>  	ret = __change_page_attr_set_clr(&cpa, 1);

This doesn't cover difference in flushing requirements. Can we get it too?

>  
> +	/* Notify HV that we have succesfully set/clr encryption attribute. */
> +	if (!ret)
> +		x86_platform.guest.enc_status_change_finish(addr, numpages, enc);
> +

Any particular reason you moved it above cpa_flush()? I don't think it
makes a difference for TDX, but still.

>  	/*
>  	 * After changing the encryption attribute, we need to flush TLBs again
>  	 * in case any speculative TLB caching occurred (but no need to flush
> @@ -2023,12 +2030,6 @@ static int __set_memory_enc_pgtable(unsigned long addr, int numpages, bool enc)
>  	 */
>  	cpa_flush(&cpa, 0);
>  
> -	/*
> -	 * Notify hypervisor that a given memory range is mapped encrypted
> -	 * or decrypted.
> -	 */
> -	notify_range_enc_status_changed(addr, numpages, enc);
> -
>  	return ret;
>  }
>  
> -- 
> 2.25.1
> 

-- 
 Kirill A. Shutemov
