Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942465;
	b=PPdHmDPZXmdpdEtO2c2kZKQrABJzVMjLTuV23vaFuaw9gly4ch+/pdE7ed1VIF51HSSd
	 8dRtpbRZXmMRBky5gEKmjGU2b+GnNj2E+N5RxIVj5/GaOFX8ONrevojI4m5qJAcFq+pQ1
	 lpeH/rGvkcwZWnQw//8a7tWfB/bjtPZ1GiVDoxzPeOLrdgpMhH3887oXktf/1Xat18Edd
	 iB0OAgaHGqEXn+wO/pdDnOoNhgyaD2Yb1s08ZR0LfubK+tlt0FoYbciGHRV6gsnZ1VHSN
	 fGe0c+38ii1ULgshnsT7Aa70zhfVYFeIDiiLPdFwYBHk6jxd0ci0KmqKnAS2cO4Pf2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942465;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+flikJNIbKhcpe2wAtcNw/6ZHpyNCMt2xcIgbjgi0uc=;
	b=r7REXWG0qcSxCSksTSOp7nQ0YjylnNW7fNZmJFd218kzR/NqiDpq8OC964aFlD04MxCE
	 PwYbjjBGduz5vwD2CRGxIQxuvELBrRr0sUnENZ8CnMEHRf3KhE8p21SyEHPXYn8px1ybO
	 Yh36hvU8dwDsw9ut7XsBh2p/UV/p1DMJnWDyGp/KLh1eA3pmZUONe+MBH5mX1TeSL2tkg
	 9kKbomhnKZQliaCd9W0FS47LuXzjh3AyghvocZCAfU/shP90D70+Poy/ft2B1zkNIouQv
	 9KEzg7deQ0Ad170RdebpyBSi6hhkyrc/o7p4JcT71GnC5FsT6YMyHsXaWFACxG1cNRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=L1ueB1zt;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D320F606A32F
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 19:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D320F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=L1ueB1zt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 03C4140E00DC;
	Tue, 17 Nov 2026 19:07:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UotxmKWqt4IP; Tue, 17 Nov 2026 19:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794942443; bh=+flikJNIbKhcpe2wAtcNw/6ZHpyNCMt2xcIgbjgi0uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1ueB1zt7XjyHTsYlDxrPMbJcmEoW2QFB59p8ygG2nUaRIAejlbwFUC7lStY3r3Y7
	 5/vtNebBUyzbhBHZPfSrN+DX4++ksqIi5Yc0JO8sZ8Ts7G9sxE/Wzxb5sayLmHNLW9
	 Y4JcbXKB8PpFfi3I/DMRSgGPCam8/00dfSv9SlKqnURcoLFJpG2bJbVMonzjcJLBn7
	 +ZE10qKTj1hIRx7pf2Zk4x34SwwSZY0ZTojAGH15i/rCGY1n7Ix/UBUN6//1DCmCHD
	 d3gPRQ285NbtdEuQ5Cx/1OZ2Mqo+QwHXuDAGDbgcok7L4ak3wJpJrscSc84gtm8Btc
	 bwYxePa6Cc9442wpw5Na3ka//rGI90HXIyeovcp3AVkroAV1KRuQnYDfsO1lG2YECs
	 uZz/6YohIEVT/IYvJ9KNDbSyaG92xqi1oM4VN83h19XpUdijqr4eCQ+1I+YKn+80UR
	 5d5Yrg92NF2Sn2wrY4nngCeJTMMm3vtMCKo/3xjpjUGDJ1ZkwBsDP97njeYrCK8rNA
	 OL+rNwOQ6CfRKc7n3PwzU3RsBEIt4W6IrYOrqwiUM6PHFmAv6z+OXtTQfZ3rrdbeJX
	 lqPJ+fSgJlBp0uV/P70l3HE3cowjg0I6W5YV+n10qJJTe4Om7Z42YH6rYlFwBh9RPY
	 TXdtBqRqBlE/7Q142f5lK24I=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7757640E01E1;
	Tue, 17 Nov 2026 19:07:17 +0000 (UTC)
Date: Tue, 17 Nov 2026 11:07:14 -0800
From: Borislav Petkov <bp@alien8.de>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: x86@kernel.org, seanjc@google.com, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH] x86/virt/tdx: Don't print error if CPU doesn't support
 TDX
Message-ID: <20261117190714.GAavyl4lS15Gwpc29U@fat_crate.local>
References: <20261117190041.158949-1-nik.borisov@suse.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261117190041.158949-1-nik.borisov@suse.com>

On Tue, Nov 17, 2026 at 09:00:41PM +0200, Nikolay Borisov wrote:
> There's still plenty of Intel CPUs which do not support TDX and when a
> recent kernel is booted on those the user always sees the following
> error:
> 
> 	virt/tdx TDX not supported by hostplatform.
> 
> The same is also printed on all AMD CPUs. Fix by using pr_info.
> 
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> ---
> 
> Contrary to Pet Shop Boy's song - it's not a sin to not support TDX, yet :)
> 
>  arch/x86/virt/vmx/tdx/tdx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index 96ced0494b68..b2962da24701 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -1276,7 +1276,7 @@ static __init int tdx_enable(void)
>  	int ret;
>  
>  	if (!cpu_feature_enabled(X86_FEATURE_TDX_HOST_PLATFORM)) {
> -		pr_err("TDX not supported by the host platform\n");
> +		pr_info("TDX not supported by the host platform\n");
>  		return -ENODEV;
>  	}
>  
> --

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
