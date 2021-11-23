Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE23F68
	for <linux-coco@lists.linux.dev>; Tue, 23 Nov 2021 15:36:39 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id q17so17359587plr.11
        for <linux-coco@lists.linux.dev>; Tue, 23 Nov 2021 07:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5VVg5sF/i5gU/ki52+bDwZvmQKpTX8HJeSrAf6kcWFQ=;
        b=U6HSgDxCZz53CGLYrJ7O5A0XNm09HecVxGKIpmb1gkV3apRWZ25N2jA23Ttyp2MYKZ
         K7PCL8IziOVl3IGVvcEKWxmZ7N5WFdDKaeFnFWDdTQL8q+kbkqylzTzEvEGM/qub8VsW
         0kNCx9MqyC2snH1QR5CdErs3MA8OmHVtnhGLtP4QLDC7rwwGeLp30owwNo0TxBfgzp/4
         z9A4yJ5wtwLQDky0itThd+HFGg3KslkVzZMf+De/ppvd/GGnqEzg8bvzIdr3jjCW1Wdw
         esOXbQYxDR8uPmd7RrzvIegmxMJgPyMy2od9otejx7jL7aU+uOEan4lmnuCo0jVl028f
         on6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5VVg5sF/i5gU/ki52+bDwZvmQKpTX8HJeSrAf6kcWFQ=;
        b=d+q1A5EcyqOlKCIXCIxmmIzxAQbHdsosPiw0URMPrGe8+rMK3gwk61XGN1hWKLge1o
         kMQ6vHLQMWrI+DcHwrXH0byvfeKH0Nj96iIlDHd/KrFrwKENHu7lQWng6/9rTfFKL1Rm
         KOIJokLC++Dnxzui2AR5uPYbiWPciDQbAJGiJT1ieXnh0JnbR7FnKHvDAQ3HxAa17Sdh
         6UFlslAQrXrXIY1S5185AM48/en0FWF0ni31Fixfdxncghkn0VkmEqr6KKik3nfEYKMr
         y1X8S9h4VE6C8zz40LyfrDNsydC2kANRbMxAz23truPNvk7bQYnDgE9ZK4ewHTgKGnrk
         U69w==
X-Gm-Message-State: AOAM532a9/zVWUi4bRD1OKpDlmIhMKXQi4KvL0SYWT1sJFrk7pPQJjIL
	rJFvNPbOSqYZ13dnkRRzN77LwQ==
X-Google-Smtp-Source: ABdhPJzN3VZxkHeunJB6N/YPoYEM/c03A9bU/hzxt4O7jM4g9pvIKKtkf8VdyZ1rwnxZzh/blb4dBw==
X-Received: by 2002:a17:902:c78a:b0:142:1b7a:930 with SMTP id w10-20020a170902c78a00b001421b7a0930mr7959825pla.8.1637681799124;
        Tue, 23 Nov 2021 07:36:39 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id k14sm9384097pga.65.2021.11.23.07.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 07:36:38 -0800 (PST)
Date: Tue, 23 Nov 2021 15:36:35 +0000
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Peter Gonda <pgonda@google.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <Thomas.Lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH Part2 v5 00/45] Add AMD Secure Nested Paging (SEV-SNP)
 Hypervisor Support
Message-ID: <YZ0KgymKvLC2HcIk@google.com>
References: <20210820155918.7518-1-brijesh.singh@amd.com>
 <CAMkAt6o0ySn1=iLYsH0LCnNARrUbfaS0cvtxB__y_d+Q6DUzfA@mail.gmail.com>
 <daf5066b-e89b-d377-ed8a-9338f1a04c0d@amd.com>
 <d673f082-9023-dafb-e42e-eab32a3ddd0c@intel.com>
 <f15597a0-e7e0-0a57-39fd-20715abddc7f@amd.com>
 <5f3b3aab-9ec2-c489-eefd-9136874762ee@intel.com>
 <d83e6668-bec4-8d1f-7f8a-085829146846@amd.com>
 <38282b0c-7eb5-6a91-df19-2f4cfa8549ce@intel.com>
 <YZyVx38L6gf689zq@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZyVx38L6gf689zq@zn.tnic>

On Tue, Nov 23, 2021, Borislav Petkov wrote:
> On Mon, Nov 22, 2021 at 02:51:35PM -0800, Dave Hansen wrote:
> > By "supporting", do you mean doing something functional?  I don't really
> > care if ptrace() to guest private memory returns -EINVAL or whatever.
> > The most important thing is not crashing the host.
> > 
> > Also, as Sean mentioned, this isn't really about ptrace() itself.  It's
> > really about ensuring that no kernel or devices accesses to guest
> > private memory can induce bad behavior.
> 
> I keep repeating this suggestion of mine that we should treat
> guest-private pages as hw-poisoned pages which have experienced a
> uncorrectable error in the past.
> 
> mm already knows how to stay away from those.

Kirill posted a few RFCs that did exactly that.  It's definitely a viable approach,
but it's a bit of a dead end, e.g. doesn't help solve page migration, is limited to
struct page, doesn't capture which KVM guest owns the memory, etc...

https://lore.kernel.org/kvm/20210416154106.23721-1-kirill.shutemov@linux.intel.com/
