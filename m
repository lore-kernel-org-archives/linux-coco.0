Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C48D11712
	for <linux-coco@lists.linux.dev>; Mon, 13 Nov 2023 06:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="izReDwsi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso35142365e9.2
        for <linux-coco@lists.linux.dev>; Sun, 12 Nov 2023 22:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699855502; x=1700460302; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N+nt+ngB41YS8+YA9mwjeT/ra7CS09vjO32TMqTgtLU=;
        b=izReDwsiZw/oXC4p1RrYkAsF2gfZ54qcNnYyge91ZU0WKxC2jbErXGDIHtRaBQasyo
         /TpxZ9w4xH04JWSgJZ35SvIwnPVuXX5VUbDpEy+KVjZzjBdU0j3sdtlS/J+4KL3x4bM5
         GICmcWTaL6afg1w2Q7EXePdvN8AxIKZrJxoJ1rx4rABG908zljk9cW6XkOfVpYR56sQn
         4x4cWMk46XjgFmFJy8sXVadAG58ARUSIc6COJjrdnXbJ8tqJupWes6PeC2J/FV5VqGPf
         9/jiFmg7gGgkdncfVi2SPDmjjhwhNdqmp4myEINlOOgwQxOA20eTmdQSiJVb6ST91rXy
         oPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699855502; x=1700460302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+nt+ngB41YS8+YA9mwjeT/ra7CS09vjO32TMqTgtLU=;
        b=BIFnvhq2WawTcMDOnNfbVj5KKr/rPGBP56IFfwlDmq75yWULYEIB3FeM7/Y3dFylKj
         Rvr1MXgRTCbTMQDuQOSbB9SOQI7nhPtLatWOLWVysEei96/I8KumAvvQkgq9xUjRAh4L
         chsuSxMyMnXXjveaEu2jZLxR6Crhw2tfyPoc9QUv+eJJcN/CTSzgisFwAXM5YF0TCKQe
         zt4XrJ8ovGJIlI9jjPinG3BFndodDDHd27enBXRIoy7fvpuL9dLsRpooWJ1jdHa1yniv
         Bu3l0qxHdJwYXxtkYnYzosUSyDsbRSqoaKfVX2CZkEPBfVF6pbZVMQf1rlJuE2GufMuc
         XIXg==
X-Gm-Message-State: AOJu0YzXVOeZ0JfxSwt+z9QnBjNUnUMkP5L3AqLUH8FKj78lwcAk3qiw
	mJQlex7JcantuuEZ9NEd8xiboQ==
X-Google-Smtp-Source: AGHT+IHFciwgtxW1rksmHcHPusfhYOJiMy7bV87co79QYsxgNyZQobB/kNC+U7rr/vXbrw7L1F+UWg==
X-Received: by 2002:a05:600c:54cb:b0:40a:45ff:fd69 with SMTP id iw11-20020a05600c54cb00b0040a45fffd69mr4856019wmb.19.1699855501521;
        Sun, 12 Nov 2023 22:05:01 -0800 (PST)
Received: from vermeer ([2a01:cb1d:81a9:dd00:a3fd:7e78:12c3:f74b])
        by smtp.gmail.com with ESMTPSA id fm6-20020a05600c0c0600b004063d8b43e7sm12740541wmb.48.2023.11.12.22.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 22:05:01 -0800 (PST)
Date: Mon, 13 Nov 2023 07:04:58 +0100
From: Samuel Ortiz <sameo@rivosinc.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Lukas Wunner <lukas@wunner.de>, Alexey Kardashevskiy <aik@amd.com>,
	linux-coco@lists.linux.dev, kvm@vger.kernel.org,
	linux-pci@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <jic23@kernel.org>, suzuki.poulose@arm.com
Subject: Re: TDISP enablement
Message-ID: <ZVG8itkUnvmhR5kG@vermeer>
References: <e05eafd8-04b3-4953-8bca-dc321c1a60b9@amd.com>
 <20231101072717.GB25863@wunner.de>
 <20231101110551.00003896@Huawei.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101110551.00003896@Huawei.com>

On Wed, Nov 01, 2023 at 11:05:51AM +0000, Jonathan Cameron wrote:
> On Wed, 1 Nov 2023 08:27:17 +0100
> Lukas Wunner <lukas@wunner.de> wrote:
> 
> Thanks Alexy, this is a great discussion to kick off.

I'd certainly agree with that.

> > On Wed, Nov 01, 2023 at 09:56:11AM +1100, Alexey Kardashevskiy wrote:
> > > - device_connect - starts CMA/SPDM session, returns measurements/certs,
> > > runs IDE_KM to program the keys;  
> > 
> > Does the PSP have a set of trusted root certificates?
> > If so, where does it get them from?
> > 
> > If not, does the PSP just blindly trust the validity of the cert chain?
> > Who validates the cert chain, and when?
> > Which slot do you use?
> > Do you return only the cert chain of that single slot or of all slots?
> > Does the PSP read out all measurements available?  This may take a while
> > if the measurements are large and there are a lot of them.
> 
> I'd definitely like their to be a path for certs and measurement to be
> checked by the Host OS (for the non TDISP path). Whether the
> policy setup cares about result is different question ;)
> 
> > 
> > 
> > > - tdi_info - read measurements/certs/interface report;  
> > 
> > Does this return cached cert chains and measurements from the device
> > or does it retrieve them anew?  (Measurements might have changed if
> > MEAS_FRESH_CAP is supported.)
> > 
> > 
> > > If the user wants only CMA/SPDM, the Lukas'es patched will do that without
> > > the PSP. This may co-exist with the AMD PSP (if the endpoint allows multiple
> > > sessions).  
> > 
> > It can co-exist if the pci_cma_claim_ownership() library call
> > provided by patch 12/12 is invoked upon device_connect.
> > 
> > It would seem advantageous if you could delay device_connect
> > until a device is actually passed through.  Then the OS can
> > initially authenticate and measure devices and the PSP takes
> > over when needed.
> 
> Would that delay mean IDE isn't up - I think that wants to be
> available whether or not pass through is going on.
>
> Given potential restrictions on IDE resources, I'd expect to see an explicit
> opt in from userspace on the host to start that process for a given
> device.  (udev rule or similar might kick it off for simple setups).
> 
> Would that work for the flows described?  
> 
> Next bit probably has holes...  Key is that a lot of the checks
> may fail, and it's up to host userspace policy to decide whether
> to proceed (other policy in the secure VM side of things obviously)
> 
> So my rough thinking is - for the two options (IDE / TDISP)
> 
> Comparing with Alexey's flow I think only real difference is that
> I call out explicit host userspace policy controls. I'd also like
> to use similar interfaces to convey state to host userspace as
> per Lukas' existing approaches.  Sure there will also be in
> kernel interfaces for driver to get data if it knows what to do
> with it.  I'd also like to enable the non tdisp flow to handle
> IDE setup 'natively' if that's possible on particular hardware.
> 
> 1. Host has a go at CMA/SPDM. Policy might say that a failure here is
>    a failure in general so reject device - or it might decide it's up to
>    the PSP etc.   (userspace can see if it succeeded)
>    I'd argue host software can launch this at any time.  It will
>    be a denial of service attack but so are many other things the host
>    can do.
> 2. TDISP policy decision from host (userspace policy control)
>    Need to know end goal.
> 3. IDE opt in from userspace.  Policy decision.
>   - If not TDISP 
>     - device_connect(IDE ONLY) - bunch of proxying in host OS.
>     - Cert chain and measurements presented to host, host can then check if
>       it is happy and expose for next policy decision.
>     - Hooks exposed for host to request more measurements, key refresh etc.
>       Idea being that the flow is host driven with PSP providing required
>       services.  If host can just do setup directly that's fine too.
>   - If TDISP (technically you can run tdisp from host, but lets assume
>     for now no one wants to do that? (yet)).

Yes, I'd say it's a safe assumption.

>     - device_connect(TDISP) - bunch of proxying in host OS.

imho TDISP should be orthogonal to the connect verb. connect is a
PF/Physical device scoped action. TDISP is a VF/TDI state machine, and
the bind verb is meant for that (This is where the TSM should start
moving the TDISP state machine to bind a TDI and a TVM together).

>     - Cert chain and measurements presented to host, host can then check if
>       it is happy and expose for next policy decision.

In the TDISP/VF passthrough case, the device cert chain and it's
attestation report will also have to be available to the guest in order
for it to verify and attest to the device.

> 
> 4. Flow after this depends on early or late binding (lockdown)
>    but could load driver at this point.  Userspace policy.
>    tdi-bind etc.
> 
> 
> > 
> > 
> > > If the user wants only IDE, the AMD PSP's device_connect needs to be called
> > > and the host OS does not get to know the IDE keys. Other vendors allow
> > > programming IDE keys to the RC on the baremetal, and this also may co-exist
> > > with a TSM running outside of Linux - the host still manages trafic classes
> > > and streams.  
> > 
> > I'm wondering if your implementation is spec compliant:
> > 
> > PCIe r6.1 sec 6.33.3 says that "It is permitted for a Root Complex
> > to [...] use implementation specific key management."  But "For
> > Endpoint Functions, [...] Function 0 must implement [...]
> > the IDE key management (IDE_KM) protocol as a Responder."
> > 
> > So the keys need to be programmed into the endpoint using IDE_KM
> > but for the Root Port it's permitted to use implementation-specific
> > means.
> > 
> > The keys for the endpoint and Root Port are the same because this
> > is symmetric encryption.
> > 
> > If the keys are internal to the PSP, the kernel can't program the
> > keys into the endpoint using IDE_KM.  So your implementation precludes
> > IDE setup by the host OS kernel.
> 
> Proxy the CMA messages through the host OS. Doesn't mean host has
> visibility of the keys or certs.  So indeed, the actual setup isn't being done
> by the host kernel, but rather by it requesting the 'blob' to send
> to the CMA DOE from PSP.
> 
> By my reading that's a bit inelegant but I don't see it being a break
> with the specification.
> 
> > 
> > device_connect is meant to be used for TDISP, i.e. with devices which
> > have the TEE-IO Supported bit set in the Device Capabilities Register.
> > 
> > What are you going to do with IDE-capable devices which have that bit
> > cleared?  Are they unsupported by your implementation?
> > 
> > It seems to me an architecture cannot claim IDE compliance if it's
> > limited to TEE-IO capable devices, which might only be a subset of
> > the available products.
> 
> Agreed.  If can request the PSP does a non TDISP IDE setup then
> I think we are fine.  

The TSM, upon receiving a connect request from the host should establish
the SPDM+IDE connection. If it never receives a bind request, it should
not do any TDISP action. This way we could have the TSM supporting both
the passthrough and non passthrough use cases.

Cheers,
Samuel.
