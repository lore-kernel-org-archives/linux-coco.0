Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6FF1FCFFC
	for <linux-coco@lists.linux.dev>; Tue, 16 Dec 2025 00:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765844416; cv=pass; b=oeiGVNi/WOKZNl0wrp7DeGE6Q4zdLwguAiQOS5LSdHdTKrVvWZ/kIVsE+s4wwvOiorGhdfDafOd8C5R7a/Hbfdpyndj3Yl03k6PsJ239Z7pQak5Ew/bLIWFIpIEEnJtX5duhc5xmVPgV6Gpd5JoPHu5E1xgsdCTNsv7dl/yS5OA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765844416; c=relaxed/simple;
	bh=klRRPxxRucOBsSf0NKoOGV1TNHKMWWUVg9IeOWd5Sg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKiLfhJyV1gADLneGfBezfGSpxotNjNVpXwB+z0hoZr3gsuNoC/guRM2NkLeT1sr3oxEPmK43HDsa6k6H23oPpkIDbtevPIfRivvAnpox+GAhr9ZwDautK8fzBHrPrgBCAtvId3XAkWDZHixtAB+hS1KxDBSGfBusTuvQgTF3Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RJiS7jJc; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RJiS7jJc"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d06cfa93so14115ad.1
        for <linux-coco@lists.linux.dev>; Mon, 15 Dec 2025 16:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765844412; cv=none;
        d=google.com; s=arc-20240605;
        b=dXj4Jeb0ePKQYlc3g4utLOTq7hhqVKg3D6R7eyFkX68G/54um+oiPTkezFJyNSbZML
         txcHoe8d6PYhUKchqZjioVm5BspagqLRBOMALnE8MQ8Jfo7ES6D8TqEF8Im+789GWb2d
         Mf4Tfnv3k8aKDAqBjNDA7YTwZbcefzTOgpKjJf5RrUG8K6KQ8EnhyWjUco0wI0LJFOZd
         CJAdp4tINmqd53WDjLq1vFx9dIUyM7jInRSGD/GXyCmds84HM5tJ/940EMErnI3r9quW
         MFpKkfpOR1ZkBK7M25cEgvPdfOLYhHzuyCocJmL5FshfrIsHRJv6n5Aa60slNAynQgU2
         cWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I/xSO2loElEQu4qJwQAmc4hWblw65frcVfwyqUV19Yo=;
        fh=af22lKGBBdICRu5qb9MbrD3yTRMTD5nkF3Ilo51CuJU=;
        b=YidiMjXPqt4pwRdJIDh0ObdBJvg88oVU4PteLZ7dzsrVSQZ2p2MogGZYN91t0s282k
         ZoP7ghq2lDKfCUFD297qUz0iKw3JLV75E0vgcah7KG3/xqBsp7oIK9GuS3AYiTfqZUi5
         od6bN+xg4LkpDCYx2HUU/eKmqcwm/+SMcoxgmSgDHqFVc/bl/VgTsFoPPyaFcFU1ayFe
         1XfaQKp9XSqU2mNHkpiI6BJhXFCXlfVL869HnGZRsM10fEmRDDgGQAipvye74JvS86mA
         pFud60aAtvsgz6WSp9/gtBfNX0dFi+rOOasR6ebLEs2CywOlOqv5fOl31OzMgIDBwU1O
         cvgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765844412; x=1766449212; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/xSO2loElEQu4qJwQAmc4hWblw65frcVfwyqUV19Yo=;
        b=RJiS7jJcKYjbzdHs5doykztO/gWeRxZaqXBr1HcCLKRgTVd1au9zyoCbxTrTuR5lJ0
         C8idcBPeuQRX9tuIsNNvg55VceDhC9Sbqlc4oWEFvkQ/KmCP0cczPrZ3EmDABobVSOt3
         Pb7BYo/n+e3fox8LJQRUZ6C5E4KB7kyTZ7NjFfByFIz6KMCE/1gqao/sGXyxNzz0JIB0
         RKhzphNoWJCgzGlK47wd2GMK5L9ou6az4c7J25E11bjuB5shephGBA7fIzMIX8UjA0gX
         JWx62bqslo5DxpTyYnqDPSUW8j42U8Ci03xBqbG311hoVJA5LOXZfdKUNikFqiF5QMRa
         j1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765844412; x=1766449212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I/xSO2loElEQu4qJwQAmc4hWblw65frcVfwyqUV19Yo=;
        b=H/HD7FPAhF996h160Msan3Q6+LUZl5E5HCd/9uEpMqisCDp5jfYVBU/2IdzM4NmKuC
         oRV8THprG+uh4pLMwcmeSFzzYy/Fr75unevGUe4jXev6C7HGJlNgyLiyiWh+kpTd7WHb
         w1crmsXTBxQcKNQmQkSddJLAoOZbQxM6rtQq3nxSYBYadLJocRl+kVuCm0PzSs4F8efu
         a0dJlxd/tD5v0HtQfhefKu/MQuraYSZkT5KOk+igQ7egFg+KSnpBDl6wMVBmdLMi7Vnk
         AZM7COyaXLJN3JEGvzFgAGwqX+otukLUgBrQ1hDEHD9BbOh4qqgYOaaeyt+VQL6q48fE
         kw3w==
X-Forwarded-Encrypted: i=1; AJvYcCUybzRDXJZhH5kEyyLuimP+rlHLFMrMOaFWuEg/J6XwoOHX35f2N8Kxx5MuA1JVxuPvmqPFt8nZos4u@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9ECFbhmZVMaHGE2l5OHxZlKqV2FfrMBzO+gUBLCxlD15h2unm
	xERjjh8mCgQuHy4l25e5Ro77YTrh11dnKK5GYvZB9gf9fgHE4BAGvGs/C2GadnW+lNAfxZ+2qew
	G1s+BT3iIFdujEH/Y9OZn/dkbECDE96JCmmka3IFT
X-Gm-Gg: AY/fxX7ZldGumie+doG4bkYy6J0aAtk018R0BHANBBPy7BDtXyeNtk5F4qlYEOJTuoY
	5zbdkqzDiA7Dh0m5FA6djxe8lmiBNBp06fVLrjVvHuAuMAqNX5CshA/rf/l4YZb46U8/8CPbzJj
	86al+nMdOIAeouqS63zT7xMuS8uqwY/UGce9V+Y/EOzpNw0F1eHn/9re1q0Y6elyKrIGuIIDzYi
	Ok0e0M5KUTTKqxK5EGD+3GN9Lkxh0HCM5QD81sSU6QEVILKzczKeMjfxAjK6MDHpu/Ln2H953OV
	MD4qNekUC/1pcABBP86QmM2AnM50
X-Google-Smtp-Source: AGHT+IExDYh7puOwTqAoucyAbhg/dhJj/UlPMmB4InOhmz+VivF2pgRZLSSnb0+pKynoL6YupSskmHHY1LN9azC6BtE=
X-Received: by 2002:a05:7022:4406:b0:11b:3bc:9ea0 with SMTP id
 a92af1059eb24-1205727676cmr408c88.6.1765844411980; Mon, 15 Dec 2025 16:20:11
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251215153411.3613928-1-michael.roth@amd.com> <20251215153411.3613928-5-michael.roth@amd.com>
In-Reply-To: <20251215153411.3613928-5-michael.roth@amd.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 15 Dec 2025 16:19:58 -0800
X-Gm-Features: AQt7F2pam8UulXqTs359SLpQ8QESA_W2EL2-JVHHwFHsPgJIIvSeUBgNcYPP6kk
Message-ID: <CAGtprH-te9xrmVgUteAaW17BLuxfZWfu32G4Q+AdP4=DDrm27g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] KVM: TDX: Document alignment requirements for KVM_TDX_INIT_MEM_REGION
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, pbonzini@redhat.com, 
	seanjc@google.com, vbabka@suse.cz, ashish.kalra@amd.com, 
	liam.merwick@oracle.com, david@redhat.com, ackerleytng@google.com, 
	aik@amd.com, ira.weiny@intel.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 7:36=E2=80=AFAM Michael Roth <michael.roth@amd.com>=
 wrote:
>
> Since it was never possible to use a non-PAGE_SIZE-aligned @source_addr,
> go ahead and document this as a requirement. This is in preparation for
> enforcing page-aligned @source_addr for all architectures in
> guest_memfd.
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  Documentation/virt/kvm/x86/intel-tdx.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/virt/kvm/x86/intel-tdx.rst b/Documentation/vir=
t/kvm/x86/intel-tdx.rst
> index 5efac62c92c7..6a222e9d0954 100644
> --- a/Documentation/virt/kvm/x86/intel-tdx.rst
> +++ b/Documentation/virt/kvm/x86/intel-tdx.rst
> @@ -156,7 +156,7 @@ KVM_TDX_INIT_MEM_REGION
>  :Returns: 0 on success, <0 on error
>
>  Initialize @nr_pages TDX guest private memory starting from @gpa with us=
erspace
> -provided data from @source_addr.
> +provided data from @source_addr. @source_addr must be PAGE_SIZE-aligned.

Reviewed-By: Vishal Annapurve <vannapurve@google.com>
