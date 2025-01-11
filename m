Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04684C96
	for <linux-coco@lists.linux.dev>; Sat, 11 Jan 2025 00:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736556031; cv=none; b=NR8WKYTcWNso8Q4xC37LiYI2xBlc+YWTaOXpw9THSgCqjbkcw1pmurvB9W8qILCI10mqaYLTdoYuIvslxYMB4RYy60/ZbOkkkBcP8TbrCetDzvSv2rB9O/gdxkCQ7JCo4iB0I9wNFZGDI3r+npIlghQ/OfFXNcMX9hnqXdsP/9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736556031; c=relaxed/simple;
	bh=LYCX+42re+3E8A1I0Co36RucaMGSTo7jis8Nnz9qJdM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XZ2rWXKepKlvlk+YFsyUP5F3p0OLBU1uzvwQsCsKQK7lXScAmORRp3zeD+cOYnRjZ5YXvM2vGV7OTT9aaLXLGbq9OqZ2HzPa7y8SO/wJu1vEbx0q+hPWEkQ3sfmvp9hnxFdAy4QF4R0wOBwLdgpnvDqfR69FMZk2e68qDDu6BOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g9sq+nfN; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g9sq+nfN"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f2a9743093so4757466a91.3
        for <linux-coco@lists.linux.dev>; Fri, 10 Jan 2025 16:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556029; x=1737160829; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9yMVbiaBA6FoWo38EEFg01Y6eTRR0fobEa+ZtoTkLg=;
        b=g9sq+nfNJ+aSCdkpMSaquZ0wcEfyy7ukwGAmJClCz6iRQ4Dhn4zuxuVO+akhPhi1p3
         yQSDLa+brgEOnSEbI6wzJXCYnqNuZqMfzU6sQbXI0JXf8R5DxtUNuIxdDxTSogGwmx43
         gID+EW8iLCyO69QGZGweXrK33BC3hh0dPBPwfX+2RzeNs27NVpWu6M5rCLZU03ZUS8Zb
         LxiODqGeU/fGUNDhz/yGzn6WISvSCnP2ARFgJ4XC7a+M8TYOZ/WkdTF9kVS/QP/kW13L
         Wz0cLyHsdhv6Kw/wGNVjIzBjuRLXwgTmbS0+XK0FtvyyFPTP+L0nIiZzxHTuvT+9G+nR
         bCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556029; x=1737160829;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9yMVbiaBA6FoWo38EEFg01Y6eTRR0fobEa+ZtoTkLg=;
        b=HrT19MarTn9EUh0Qb8hCZNJTtg7pfYKCACqUbIphMmOAfE4e9Lw1Li2VZYseZKaGnC
         VA8iwLeMnzGVTzxNRF2WkRHrPbjbqSza4S0FzB6pBG79fJAj4nq6jBCDjUClv5R0q7JM
         vHDXc3I+ZMSxd1TYmjf1FTDnXBI9bhhc+sP77ddpNEZ0AShOSgji1dbbS1H8aCvfa/Jn
         AhwR28Fiqw81k+oK5KWA6URNR3f4SKV2tHUbgYvVYwxlFsRqP9LO9dtX3hnNXY1riZVp
         4ybmcKjYviEVKH98NXy8QurWF+nmZ9ApMpTsZtDsLzJIeBryj3k1WtFIUaaKDv2Y6F1Z
         fStQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCnxBuvRl0ii44dojn8xHSJXKofkZ0/xI1GHiSd4mzaZc86PTM73UGQmrSE6I8eQfpgmEks7EZJPMd@lists.linux.dev
X-Gm-Message-State: AOJu0YxEvYm7jCXyVlzyuLr74x+8VDyErZAIMxZ1UL80+ZE2idIvBkvA
	sb1m/q5zUm3iH8Fqi+Qugmoln21L7YDIX+NZ3nnTtfQ/SKTu2/ILQjqt2y2+EgKMTGPNWCD+Dvd
	80A==
X-Google-Smtp-Source: AGHT+IF6dJqkFdvJ/t4pUYySPc+qKbEBtTOzjtwAhnrNAl1U2vPupjI6nWiArj29VBbhv0O4Szus9aJ2EzQ=
X-Received: from pjbsb4.prod.google.com ([2002:a17:90b:50c4:b0:2ea:5c73:542c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:540e:b0:2ee:a76a:830
 with SMTP id 98e67ed59e1d1-2f548f1b2bfmr20165708a91.24.1736556029072; Fri, 10
 Jan 2025 16:40:29 -0800 (PST)
Date: Fri, 10 Jan 2025 16:40:27 -0800
In-Reply-To: <d6d08c6b-9602-4f3d-92c2-8db6d50a1b92@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1735931639.git.ashish.kalra@amd.com> <14f97f58d6150c6784909261db7f9a05d8d32566.1735931639.git.ashish.kalra@amd.com>
 <6241f868-98ee-592b-9475-7e6cec09d977@amd.com> <8ae7718c-2321-4f3a-b5b7-7fb029d150cf@amd.com>
 <8adf7f48-dab0-cbed-d920-e3b74d8411cf@amd.com> <ee9d2956-fa55-4c83-b17d-055df7e1150c@amd.com>
 <d6d08c6b-9602-4f3d-92c2-8db6d50a1b92@amd.com>
Message-ID: <Z4G9--FpoeOlbEDz@google.com>
Subject: Re: [PATCH v3 6/7] KVM: SVM: Add support to initialize SEV/SNP
 functionality in KVM
From: Sean Christopherson <seanjc@google.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, john.allen@amd.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, michael.roth@amd.com, dionnaglaze@google.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Fri, Jan 10, 2025, Ashish Kalra wrote:
> It looks like i have hit a serious blocker issue with this approach of moving
> SEV/SNP initialization to KVM module load time. 
> 
> While testing with kvm_amd and PSP driver built-in, it looks like kvm_amd
> driver is being loaded/initialized before PSP driver is loaded, and that
> causes sev_platform_init() call from sev_hardware_setup(kvm_amd) to fail:
> 
> [   10.717898] kvm_amd: TSC scaling supported
> [   10.722470] kvm_amd: Nested Virtualization enabled
> [   10.727816] kvm_amd: Nested Paging enabled
> [   10.732388] kvm_amd: LBR virtualization supported
> [   10.737639] kvm_amd: SEV enabled (ASIDs 100 - 509)
> [   10.742985] kvm_amd: SEV-ES enabled (ASIDs 1 - 99)
> [   10.748333] kvm_amd: SEV-SNP enabled (ASIDs 1 - 99)
> [   10.753768] PSP driver not init                        <<<---- sev_platform_init() returns failure as PSP driver is still not initialized
> [   10.757563] kvm_amd: Virtual VMLOAD VMSAVE supported
> [   10.763124] kvm_amd: Virtual GIF supported
> ...
> ...
> [   12.514857] ccp 0000:23:00.1: enabling device (0000 -> 0002)
> [   12.521691] ccp 0000:23:00.1: no command queues available
> [   12.527991] ccp 0000:23:00.1: sev enabled
> [   12.532592] ccp 0000:23:00.1: psp enabled
> [   12.537382] ccp 0000:a2:00.1: enabling device (0000 -> 0002)
> [   12.544389] ccp 0000:a2:00.1: no command queues available
> [   12.550627] ccp 0000:a2:00.1: psp enabled
> 
> depmod -> modules.builtin show kernel/arch/x86/kvm/kvm_amd.ko higher on the list and before kernel/drivers/crypto/ccp/ccp.ko
> 
> modules.builtin: 
> kernel/arch/x86/kvm/kvm.ko
> kernel/arch/x86/kvm/kvm-amd.ko
> ...
> ...
> kernel/drivers/crypto/ccp/ccp.ko
> 
> I believe that the modules which are compiled first get called first and it
> looks like that the only way to change the order for builtin modules is by
> changing which makefiles get compiled first ?
> 
> Is there a way to change the load order of built-in modules and/or change
> dependency of built-in modules ?

The least awful option I know of would be to have the PSP use a higher priority
initcall type so that it runs before the standard initcalls.  When compiled as
a module, all initcall types are #defined to module_init.

E.g. this should work, /cross fingers

diff --git a/drivers/crypto/ccp/sp-dev.c b/drivers/crypto/ccp/sp-dev.c
index 7eb3e4668286..02c49fbf6198 100644
--- a/drivers/crypto/ccp/sp-dev.c
+++ b/drivers/crypto/ccp/sp-dev.c
@@ -295,5 +295,6 @@ static void __exit sp_mod_exit(void)
 #endif
 }
 
-module_init(sp_mod_init);
+/* The PSP needs to be initialized before dependent modules, e.g. before KVM. */
+subsys_initcall(sp_mod_init);
 module_exit(sp_mod_exit);
