Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D63023A8
	for <linux-coco@lists.linux.dev>; Fri, 27 Jan 2023 07:17:53 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h12so4080769wrv.10
        for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 23:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zu8F0YryLt/OgLyDbyT+COsXBWZJ+zCIx+ZWtC5IKkg=;
        b=WGY7E/PSjYEz982lSPv35cpucEGupEadtERlumDXtX8XKQL1ufwwK8jq1WeP0lRpj7
         yvTrhd3+v8b/ZVucRajffMcKWHm1L1k7Dats/WD17n4S1Dxx6Bb8JLxFajnEfHcRHaU7
         UPo/mJTsx7izz4mLpE95UWikJKc0ZFJijx1tfWVRJ/NrlFgoUEs2+qvEjq8HzgRc7tBA
         Tcq9KWlx08MRHTkwySZvNQ5X37m497rbR/NuBNYm6xZOo3JQdwdouGLRKA4dCcVP/qgG
         gBzOjNqThoUBnFSw0xHp0ddueyP9+5QEkONaBmxtJerDTpPI61wQnSLkXk7mZeE15jIW
         SG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zu8F0YryLt/OgLyDbyT+COsXBWZJ+zCIx+ZWtC5IKkg=;
        b=EPoyfCgF4lsfjE20H0lQSPLDCOF2eQrwsKSGIL0vLNuMjc5Wm1JqlNre7XC0Ocgt6+
         YS/bUZWmtIEfDIBoTWYuCkH8YUq+IoTiWylhlsiTYxys56mG/jbf5f2W//7n6dMhifGq
         F4uCvudziQ4uR39bxQdOQN8WvuDkrP1jplPuvGIh5bX6q5gPXLO0jSr+b5AXLgIEfe45
         BdxF3LdE1jjuv+gqUzDst1VSlSJbIpBdeKXfHx6RB+zARA4BxRKqA3BZwx2HYC+diENi
         uQAMMwKI2uKH3RfKUHsENGQY9nc++8sNU27sLDGZtHqMjq3RiRRFxNXf07jn4GkyqbBn
         XmNw==
X-Gm-Message-State: AO0yUKUr3Ec3neH7DsT0ovdMBiZMb4KMabCeEDnLzHwvi/r/0ACN5r3U
	Up9WxPG8RbOARj2ksgWzuk+RpQ==
X-Google-Smtp-Source: AK7set+B3n3giZrrrzvhrZe5kohk1pMxsQkkUJJDZp8hEVRVSrL+hCD+foHS8sR4KeguBUH965OCDw==
X-Received: by 2002:adf:f7cd:0:b0:2bf:d511:18a9 with SMTP id a13-20020adff7cd000000b002bfd51118a9mr858226wrq.29.1674803871740;
        Thu, 26 Jan 2023 23:17:51 -0800 (PST)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d43cd000000b0027cb20605e3sm3272136wrr.105.2023.01.26.23.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 23:17:51 -0800 (PST)
Date: Fri, 27 Jan 2023 08:17:48 +0100
From: Samuel Ortiz <sameo@rivosinc.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Shishkin, Alexander" <alexander.shishkin@intel.com>,
	"Shutemov, Kirill" <kirill.shutemov@intel.com>,
	"Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>,
	"Kleen, Andi" <andi.kleen@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"Poimboe, Josh" <jpoimboe@redhat.com>,
	"aarcange@redhat.com" <aarcange@redhat.com>,
	Cfir Cohen <cfir@google.com>, Marc Orr <marcorr@google.com>,
	"jbachmann@google.com" <jbachmann@google.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	James Morris <jmorris@namei.org>,
	Michael Kelley <mikelley@microsoft.com>,
	"Lange, Jon" <jlange@microsoft.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pci@vger.kernel.org
Subject: Re: Linux guest kernel threat model for Confidential Computing
Message-ID: <Y9N6nP+Z67TnEaMa@vermeer>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com>
 <Y9Ex3ZUIFxwOBg1n@work-vm>
 <Y9E7PNmSTP5w2zuw@kroah.com>
 <Y9FDZPV7qENtNNyk@work-vm>
 <20230125215333.GA18160@wunner.de>
 <CAGXJix9-cXNW7EwJf0PVzj_Qmt5fmQvBX1KvXfRX5NAeEpnMvw@mail.gmail.com>
 <20230126154449.GB4188@wunner.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126154449.GB4188@wunner.de>

On Thu, Jan 26, 2023 at 04:44:49PM +0100, Lukas Wunner wrote:
> On Thu, Jan 26, 2023 at 10:24:32AM +0100, Samuel Ortiz wrote:
> > On Wed, Jan 25, 2023 at 11:03 PM Lukas Wunner <lukas@wunner.de> wrote:
> > > CMA/SPDM (PCIe r6.0 sec 6.31) is in active development on this branch:
> > >
> > > https://github.com/l1k/linux/commits/doe
> > > 
> > > The device authentication service afforded here is generic.
> > > It is up to users and vendors to decide how to employ it,
> > > be it for "confidential computing" or something else.
> > >
> > > Trusted root certificates to validate device certificates can be
> > > installed into a kernel keyring using the familiar keyctl(1) utility,
> > > but platform-specific roots of trust (such as a HSM) could be
> > > supported as well.
> > 
> > This may have been discussed at LPC, but are there any plans to also
> > support confidential computing flows where the host kernel is not part
> > of the TCB and would not be trusted for validating the device cert chain
> > nor for running the SPDM challenge?
> 
> As long as a device is passed through to a guest, the guest owns
> that device.  

I agree. On a SRIOV setup, the host typically owns the PF and assigns
VFs to the guests. Devices must be enlightened to guarantee that once
one of their VFs/interfaces is passed to a trusted VM, it can no longer
be modified by anything untrusted (e.g. the hypervisor).

> It is the guest's prerogative and duty to perform
> CMA/SPDM authentication on its own behalf.  If the guest uses
> memory encryption via TDX or SEV, key material established through
> a Diffie-Hellman exchange between guest and device is invisible
> to the host.  Consequently using that key material for IDE encryption
> protects device accesses from the guest against snooping by the host.

On confidential computing platforms where a security manager (e.g.
Intel TDX module) manages the confidential guests, the IDE key
management and stream settings would be handled by this manager. In
other words, the SPDM requester would not be a Linux kernel.
FWIW, Intel recently published an interesting description of TEE-IO
enabling with TDX [1].

> SPDM authentication consists of a sequence of exchanges, the first
> being GET_VERSION.  When a responder (=device) receives a GET_VERSION
> request, it resets the connection and all internal state related to
> that connection.  (SPDM 1.2.1 margin no 185: "a Requester can issue
> a GET_VERSION to a Responder to reset a connection at any time";
> see also SPDM 1.1.0 margin no 161 for details.)
> 
> Thus, even though the host may have authenticated the device,
> once it's passed through to a guest and the guest performs
> authentication again, SPDM state on the device is reset.
> 
> I'll amend the patches so that the host refrains from performing
> reauthentication as long as a device is passed through.  The host
> has no business mutating SPDM state on the device once ownership
> has passed to the guest.
> 
> The first few SPDM exchanges are transmitted in the clear,
> so the host can eavesdrop on the negotiated algorithms,
> exchanged certificates and nonces.  However the host cannot
> successfully modify the exchanged data due to the man in the middle
> protection afforded by SPDM:  The challenge/response hash is
> computed over the concatenation of the exchanged messages,
> so modification of the messages by a man in the middle leads
> to authentication failure.

Right, I was not concerned by the challenge messages integrity but by
trusting the host with verifying the response and validating the device
cert chains.

> Obviously the host can DoS guest access to the device by modifying
> exchanged messages, but there are much simpler ways for it to
> do that, say, by clearing Bus Master Enable or Memory Space Enable
> bits in the Command Register.  DoS attacks from the host against
> the guest cannot be part of the threat model at this point.

Yes, the host can DoS the guest at anytime it wants and in multiple
ways. It's definitely out of the confidential computing thread model at
least.

Cheers,
Samuel.

[1] https://cdrdv2-public.intel.com/742542/software-enabling-for-tdx-tee-io-fixed.pdf

