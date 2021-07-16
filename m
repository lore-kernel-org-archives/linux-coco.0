Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A8D173
	for <linux-coco@lists.linux.dev>; Fri, 16 Jul 2021 19:33:36 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id d12so10920463pgd.9
        for <linux-coco@lists.linux.dev>; Fri, 16 Jul 2021 12:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bTfimW7x83FCVFcfi2WAn0Cbjb2ZgRjY254vPotYxPM=;
        b=gLImRTTcl99pctFwFn9UCqCov03WvN5lkMsW6nWwr384I/+cmwj+1ZHSGlrrZdl7d5
         TLN+/m5Nfv5qKcE2GQunEOLzJB7L3PP6ZDyVbn6JNFdvHjmFxu78glmP3iIRHsw9wr+a
         H824qnog8pZlEDCRCTJ6HOP2L3o2UP8efLhLfBaXUcKxAoDb5znXSQWleWyBbWLEJj9B
         jvBCxQWNgzkeVM92UjyzQFGU1mQBnWXpAZcxh7SQ0MCcRlHittiWeZLW69P6RW1mT8FQ
         u3D6YbSXZKiUPT2FPaQRh65zBcahuVR55fkNhWuKOqwKOyjpx+kmRB+UTrj4/4D9JKvI
         s10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bTfimW7x83FCVFcfi2WAn0Cbjb2ZgRjY254vPotYxPM=;
        b=EiZmwPZLfjXd7oFr2PcPYyrDniDTyRcSHAbw/MlECL1+WXrSs8Gmy9fTpo4DxCJ4At
         XnPOCgyvOoXTI/il1aLzNljL8VHtYf9jc5wj3Pii8P3a1fhgkACx0qEPDBbT4Ph6Ja0Z
         TQyG9/6PqBuPjuA6j3pLtlh44wxGiz5F5dT8SwaB2KxqoGosDCZvIrMggJ6dEBu5J0WW
         L+mCYQ2svcpQJMxHrUesj8bXBBR+P0FFep+MHMRMrGcskQOLsjm3tDyIJgA3LnluM4IV
         9F1HL/BIzMo6N4cJiyGv2B+EXXim0GS6LhGzPM4ryVEW3IhE3BJEMa3FxuNSlNJm+Q6w
         neNg==
X-Gm-Message-State: AOAM532xXpCY7IFeJZ2HLJDKL3e9ztks79FPQDQdgjREesYv6kAJZ3p2
	xWLTfQn7IcecGFo5vhMGifeYMA==
X-Google-Smtp-Source: ABdhPJzOniqffULuzP8aWisOtiLK+NTXPgX8ACLtySTB0tER8yPBpCPFaT3MWTs6mE953cLz2x0NBQ==
X-Received: by 2002:a63:f901:: with SMTP id h1mr11601639pgi.69.1626464015722;
        Fri, 16 Jul 2021 12:33:35 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id c10sm10695587pfo.129.2021.07.16.12.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 12:33:35 -0700 (PDT)
Date: Fri, 16 Jul 2021 19:33:31 +0000
From: Sean Christopherson <seanjc@google.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
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
	Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com,
	npmccallum@redhat.com, brijesh.ksingh@gmail.com
Subject: Re: [PATCH Part2 RFC v4 22/40] KVM: SVM: Add KVM_SNP_INIT command
Message-ID: <YPHfC1mI8dQkkzyV@google.com>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-23-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707183616.5620-23-brijesh.singh@amd.com>

On Wed, Jul 07, 2021, Brijesh Singh wrote:
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 3fd9a7e9d90c..989a64aa1ae5 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1678,6 +1678,9 @@ enum sev_cmd_id {
>  	/* Guest Migration Extension */
>  	KVM_SEV_SEND_CANCEL,
>  
> +	/* SNP specific commands */
> +	KVM_SEV_SNP_INIT = 256,

Is there any meaning behind '256'?  If not, why skip a big chunk?  I wouldn't be
concerned if it weren't for KVM_SEV_NR_MAX, whose existence arguably implies that
0-KVM_SEV_NR_MAX-1 are all valid SEV commands.

> +
>  	KVM_SEV_NR_MAX,
>  };
