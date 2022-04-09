Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5189A20
	for <linux-coco@lists.linux.dev>; Sat,  9 Apr 2022 23:43:29 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id r2so543282ljd.10
        for <linux-coco@lists.linux.dev>; Sat, 09 Apr 2022 16:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SbKyvpQHPm0kNgMAVs494Hgh1ccd/JUvncGHbdpX/0c=;
        b=FVJ72+0uXZ5+QgDax7JJqXVRky+XwJa7ewjqDd/F/ZjzrzjSF1n3eornqoh6nwYCS7
         THynzhfPinFJoP9K+AMKDfno5noxszxwgU6YNMBbY0Hsu3Oa7os7ckim5xqlQfP58HGC
         MwwxoeL8n//yaUuXIBoyf0guUcccIvA+GYmYvMk50cs+jI+mLGHuK3u1xQzF6veUt1Da
         mKOeKE9vaYsdtntOhAfR2iebc53jt3mcDeYPKXhnILhRLGPwScjSk1TsdhNzirzWxfjH
         pEBYYb6TBLF51dR1kKXHTQSX3S7hCkznxwVZKy4WA+fCiGx/O+Awq+mcjLnHK21ZEgxG
         ruJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SbKyvpQHPm0kNgMAVs494Hgh1ccd/JUvncGHbdpX/0c=;
        b=31HPaijdhlBPY/difVQKYPg/XRn36JtWZrZdxz291iX1KHIxZY9sG8bmvvB1vKr5iu
         sx85w8FwVhZNyAMUvdpFcoKYMibDQaeSTh4eEYe52mJ4eOJqWQ7ceK2f+tVvDkYPybxi
         oxNea3GxUkmgG5s7+yfjnxKgvTMRSfFUiXC7yhClCW1LW0ndm0x7IN88YXGWkczinV+D
         FloaJkuoTU58tWkxqjAkQvuOEbWaZkCHxdXhylig6YBy66Hn8WUtHX95XVED4QrRuF0m
         S9cLehry+5aCauHSxTKXJj9vkEPGPhyvrL9HdJSvcGS8gmm5pV6pMC+GOXaxwmZaMg2E
         0dLQ==
X-Gm-Message-State: AOAM533Df+dNw+F9XTigwbFakyJmIIBCNv47xMmiKHx6WAE5T6apUi6F
	hE6PX7Q0E4h9QibIhD1HI1by1Q==
X-Google-Smtp-Source: ABdhPJxS1PCp/vzN2dy3Ii8M1UVX5LPIaKWjRgkLRSdf248ssxYFzHzDsfML9N16/gwWJwDQ1SZ02g==
X-Received: by 2002:a2e:99da:0:b0:24b:4607:d6e7 with SMTP id l26-20020a2e99da000000b0024b4607d6e7mr8814324ljj.519.1649547807704;
        Sat, 09 Apr 2022 16:43:27 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id o17-20020a2e90d1000000b0024b54a20cdcsm486775ljg.7.2022.04.09.16.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 16:43:26 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id 2BB96103FB7; Sun, 10 Apr 2022 02:44:58 +0300 (+03)
Date: Sun, 10 Apr 2022 02:44:58 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 0/8] mm, x86/cc: Implement support for unaccepted memory
Message-ID: <20220409234458.ysisolzd7hktpfjc@box.shutemov.name>
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
 <95eabe79-a13b-79b1-1196-407920531f20@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95eabe79-a13b-79b1-1196-407920531f20@intel.com>

On Fri, Apr 08, 2022 at 10:02:13AM -0700, Dave Hansen wrote:
> On 4/5/22 16:43, Kirill A. Shutemov wrote:
> > Patches 1-6/7 are generic and don't have any dependencies on TDX. They
> > should serve AMD SEV needs as well. TDX-specific code isolated in the
> > last patch.
> 
> Oh, that's quite nice.  Are the SEV-SNP folks planning on using this?
> If they are, acks/reviews would be much appreciated.

AMD folks tested one of previous revision and reported that it works, but
I don't remember seeing the code that hook ups AMD implementation.

-- 
 Kirill A. Shutemov
