Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03AD6FB1
	for <linux-coco@lists.linux.dev>; Wed, 25 Jan 2023 20:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1DEC433EF;
	Wed, 25 Jan 2023 20:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674677644;
	bh=IIhQ2n4TFirL+HSKieunuuAJKTG6lyOUEfvKpLkA6RY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z95VHzexg+FPTfcsXE0wheQ27L7rLHS41DjEWooE1eUKAjCZhqI8F/nbN97jk3V4x
	 P2sXJTiAOaOggw7DpwJA01j+HZ6O0gURSCIvfe5WjfttKkgt84REmMqjhg9/asl2E9
	 ERLLaTDPV0XqLJEpurv00UY7PRbGRzwo1lbj26n62tOKtvHWybsNux/xPR2rO1+YUy
	 cjl+g2mGWiHNYXyygwc/DQNclePsnNb8k1Qng8KU/eYYHTfZvWAFChzodwp47Bp8HB
	 P0SF3AqK9Z0Wcx29vFQxnfjzxvvDXJrsY1GQh+WXJRkezZGTJLdvovbakekepJXvW+
	 RroFnbplyCBCA==
Date: Wed, 25 Jan 2023 21:13:56 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
    "Reshetova, Elena" <elena.reshetova@intel.com>, 
    "Shishkin, Alexander" <alexander.shishkin@intel.com>, 
    "Shutemov, Kirill" <kirill.shutemov@intel.com>, 
    "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>, 
    "Kleen, Andi" <andi.kleen@intel.com>, 
    "Hansen, Dave" <dave.hansen@intel.com>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, 
    "Wunner, Lukas" <lukas.wunner@intel.com>, 
    Mika Westerberg <mika.westerberg@linux.intel.com>, 
    "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
    "Poimboe, Josh" <jpoimboe@redhat.com>, 
    "aarcange@redhat.com" <aarcange@redhat.com>, Cfir Cohen <cfir@google.com>, 
    Marc Orr <marcorr@google.com>, 
    "jbachmann@google.com" <jbachmann@google.com>, 
    "pgonda@google.com" <pgonda@google.com>, 
    "keescook@chromium.org" <keescook@chromium.org>, 
    James Morris <jmorris@namei.org>, Michael Kelley <mikelley@microsoft.com>, 
    "Lange, Jon" <jlange@microsoft.com>, 
    "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Linux guest kernel threat model for Confidential Computing
In-Reply-To: <Y9E7PNmSTP5w2zuw@kroah.com>
Message-ID: <nycvar.YEU.7.76.2301252112120.3004@gjva.wvxbf.pm>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com> <Y9EkCvAfNXnJ+ATo@kroah.com> <Y9Ex3ZUIFxwOBg1n@work-vm> <Y9E7PNmSTP5w2zuw@kroah.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Jan 2023, Greg Kroah-Hartman wrote:

> How do you trust you got real data on the disk?  On the network?  Those 
> are coming from the host, how is any of that data to be trusted?  Where 
> does the trust stop and why?

This is all well described in AMD SEV-SNP documentation, see page 5 of 
[1]. All the external devices are treated as untrusted in that model.

[1] https://www.amd.com/system/files/TechDocs/SEV-SNP-strengthening-vm-isolation-with-integrity-protection-and-more.pdf

-- 
Jiri Kosina
SUSE Labs
