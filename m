Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ABA2C83
	for <linux-coco@lists.linux.dev>; Fri, 15 Oct 2021 20:27:34 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id 21so7065709plo.13
        for <linux-coco@lists.linux.dev>; Fri, 15 Oct 2021 13:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aaCe1c/Il7mwzazLNOhBGe2zeoY0WJjHVx8W7f1BZpY=;
        b=VHlnVWlZ/Pi2ld0Wgs4bKW4ri4LZhR1mLrjD69QcbOsw5z3yd7R0KP+xvCIFwoCuF6
         45XI8i1uJ89nfB+II5BqxkkMe7Q5HyhfoIve+oqsATzlugEJXT8kZCH8NAuTpdVRpH23
         IckZs4yOSQ3AGBE1qy6aZRWByu55YprOLoPFlSOodj4vA64qeuoxyqkZwXp2VJMbr1ys
         hm8/fjdTMe4NI1MsXOqsPhkmAqOl7Z69QZQc22mmlXVdI8SaBN5ZJyuIXb16u/BUK+vp
         p8jFDDinLpd1p6zcVEI04X9REwumzJqZgZ/8zPyCUeuieKdYE3KHSle5dIxhjLTV3xJj
         RFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aaCe1c/Il7mwzazLNOhBGe2zeoY0WJjHVx8W7f1BZpY=;
        b=KxQiytUV38vXXMmvMG/WppKc4gKurUyCIwqqe6OO7hyiwq281ZmDeP2VK/Kb2fLbIh
         S0HY6XNSnJvTJbNr8zY41hMDDXbiosRoD6omp6Cg7paWV3bqiEKSOpDT1uF0SF5WqCU5
         HINGDyjB7XTqqBxn6aqdxDs/gpqKebGXfhreXayJ9tqmQFa9JL3sIQ7q6cge04DSnhBo
         oTz8+TlusIWY4ubxhs82TcKAJO3sbO2U+L4PbtPJYR/XNUeWdww5GXGA1eAvhX8VS86L
         QrSXc5z0xkT5hLMjUA2P/MGUUhuj+VwakKV3i0cSjebqgd0w1Os6RDKDTsUR+aOQNq9x
         4YTw==
X-Gm-Message-State: AOAM53360sufOoaaP7fxmHWbMw26TSdoRzWrCkysdTgEg5lAzGcKwe1S
	JfCM0MinHqiBOO5YKyNjSf9sqQ==
X-Google-Smtp-Source: ABdhPJyMgV4d0MRDRJMTxbsrDlkWbmCHM9MvjK5KFtNvkfUV62+XAfcThk5V8SCnlNHJcjIB0quT5g==
X-Received: by 2002:a17:90a:858e:: with SMTP id m14mr30194808pjn.1.1634329653554;
        Fri, 15 Oct 2021 13:27:33 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id i2sm12231684pjg.48.2021.10.15.13.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 13:27:32 -0700 (PDT)
Date: Fri, 15 Oct 2021 20:27:29 +0000
From: Sean Christopherson <seanjc@google.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>, Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH Part2 v5 05/45] x86/sev: Add helper functions for
 RMPUPDATE and PSMASH instruction
Message-ID: <YWnkMXdL89AHPF10@google.com>
References: <20210820155918.7518-1-brijesh.singh@amd.com>
 <20210820155918.7518-6-brijesh.singh@amd.com>
 <YWnC++azH3xXrMm6@google.com>
 <3fc1b403-73a1-cf2e-2990-66d2c1ecdfa3@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fc1b403-73a1-cf2e-2990-66d2c1ecdfa3@amd.com>

On Fri, Oct 15, 2021, Brijesh Singh wrote:
> On 10/15/21 1:05 PM, Sean Christopherson wrote:
> > On Fri, Aug 20, 2021, Brijesh Singh wrote:
> >> +	if (!cpu_feature_enabled(X86_FEATURE_SEV_SNP))
> > Shouldn't this be a WARN_ON_ONCE()?
> 
> Since some of these function are called while handling the PSC so I
> tried to avoid using the WARN -- mainly because if the warn_on_panic=1
> is set on the host then it will result in the kernel panic.

But why would KVM be handling PSC requests if SNP is disabled?
