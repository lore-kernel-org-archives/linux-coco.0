Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794563322;
	b=0vrXYCVBVMwNUDNBc64SPGvndM6M+BcND8ME2K6nM8V8THji4jrzHOtJQdqXlMMNcN65
	 k1Nv8Udwk7jddw5dgLGBwINxTktZ1j2FUuDvrKNLQPKiQPr28SVro32SI4q+RUNmGqfVE
	 S7WAuNQSTEsSyojsqUOVmIvjHSQOa5wuUgP9wvj9pWzPaOp+u21eeaQVzXenKzlKIGiwn
	 CiAIkeOaa2/5XD0FMJfjlPHKYTaOVbfc8lE/SM4Q7MtCru4E+JHk4vcvHSfK+Hvb2I3Hh
	 S2SUtdxBbL8QSja0FI6BGvY2TSj9yYfHB0gQDts05jBN7UDKdbaZaaXB4HelaD7Bbhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SZEm3fBRIvJbx/BoWtbu1KusfNuPE7i14QPaGaBXJ5E=;
	b=e6NYhRN5vhwNaowbkOjQeN47/CKdM0b3b3jsIodsWPfNhmbBPCbju/VqdOLXCtzPu0y/
	 kPC776oEw3ySIgaJqOWmKGro8yTYj6qUTFvDlRv4kmYh3H2/ycfA0NBKXZqYiPQAlOhfz
	 3u+TK5FIVUPwKCwrBZM854J8RD9lUPBPIxCIVqs3tpx1laD09dtZurivVWk8eVvVImahZ
	 KuE6FYisME5aFJGvo09wbiv/TSckCUmqsTH3Oq8Xa5UNWaeIAJDTNroK4/9MYUeePQOyd
	 34BpJwV8JZDY6vWZtzD0Djoy/l4OUIo709aem/TkP4GCt9BChoxAYxRUdr1fCDegfPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTXcpQzy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E52F606A881
	for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 09:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E52F606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTXcpQzy
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-7143451981fso1063067eaf.3
        for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 01:48:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794563321; cv=none;
        d=google.com; s=arc-20260327;
        b=ima73Wg9ELUKpxoCWkWVptcbYz/Zo8gid1dxKxymyylnGgkmMGMuOeHKaEpXiiSpi4
         N5xgwvVkCMooZvwsqo8oFWsXH1MTq5Vb5MP3ufElN+Nrno7TmL7vOIWpk++/w+rsq6bL
         m/F4yN61bp75k7QJAH+BsqZ2ZWDVYrDZdmUz+W0qInrgCn1jbHlmRJFWlGBZomSAJGb3
         CggnXqmYhVnu2LSyQUqaDeU+9l5Z+JeMNUWttxSl/HBSD07rnRhQvu5z/BE81uphz+3O
         xTdd/IlgteOfCUw8rWGazdJmUPexxuy5UTmCr3OfKS0sMP/O/X8dMl9jULqdskWq+uIr
         bNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SZEm3fBRIvJbx/BoWtbu1KusfNuPE7i14QPaGaBXJ5E=;
        fh=gW82avkGK4o4FkbyzBBvIspFHEB8ZQ2fhJZO73CLJ5c=;
        b=h5HN45hzsr53vV5vfxwNBx8wIcSDB3IHBQvi0FKqd8YwM0YtVySgUixxbCLRbWmSH2
         MQsIzZxMMw5uRyllaM/CGPT6oPrypXkACYmcGoHW4x/uW6aROGQ3ZBILd+r7bnrnIGby
         D8zlLzo4KZNoYqQtCCHnROo2/cUqQI6+XKdrYDuyZHpomcogcyyQSvmj3oXOcKnUsFGt
         5i69yTEkdH2G1S1YB2VQHdpjWITvKKxdFRQXf81+/PtAG7a1zWMX03RFyqZaTpET3K8r
         XFFp9S/zeQl9+NRL/F1CcFsu7yT+8WSIwcXsxxAZ8RJsQ9bJcSBOOmJeFjXw70fEkyz1
         tAvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563321; x=1795168121; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZEm3fBRIvJbx/BoWtbu1KusfNuPE7i14QPaGaBXJ5E=;
        b=KTXcpQzymCBVjqSf4ajgKRAisNgARJK4tLJhJNSOFjGSh0+fLDUKQJdMhyKqk/DerA
         wxAl3xm5wpIRHzc5EyTZ9//aP9LAXeqni3G0afqMDZ/J4sDTivDxXLyx274b/aKUhlwa
         SMISka/x/rG9KpemozZSj0VUMaObtC+PcKMIDCKr7nwnSGd9VFcowyQ1Wfo1SJhzvldy
         XJEPM7ZycymDsYOyORq+DGMfeq0MEW30oayhlp0gko6bXPqQXhF6nLwXXxclERrBfhMX
         fO+P7L8Nt6FizzPKjX9uJXVKktGO+MGGC32pGRpJ0SEaN2QRmcW5S24pjhrb31EiKX8T
         eeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563321; x=1795168121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SZEm3fBRIvJbx/BoWtbu1KusfNuPE7i14QPaGaBXJ5E=;
        b=cVz6OwLvxRh+9WuHKe99y6iYg0pu3h1xwrku0VDLx08W93vNStM/9jDR5NPgaGUa8A
         n96Y1Le35Slk6w3Cawr1f/YnkmM9xNI4SkhVo5Cim42x/WK+iIZwDMtrBzCPD+Th7zlN
         ZMBp1YyeCyI1y0Y6DLTYQt7Sa6r91jUlXy+Q+57OLRR81NyqNZywF/4JcjvLOScszK8V
         zZ80NDt4j9lQPjsGfY3lb/bsEN3nyXkWXOvJdwwZ+lxgBF/OaOCEZ+AWN9HucR7zpRmK
         sTxRPxPZ06VzGt5lzyv0VxNAKBkPd1Ji5dpmbOjBL1LG8V4/M13YBdnOmM5otOfMzpIV
         wqVA==
X-Forwarded-Encrypted: i=1; AL+hErEjBGHX9NEBwV+nTqafhope/vOzQnlSK2N7W49t6lQH7hNdKhOJ+1rNGCSNaOjdnCWu8IN+SmLILf/y@lists.linux.dev
X-Gm-Message-State: APuU4Z8c+Um2+PYKFkiLfnV4TqwLzSh+M4rppw9CGS6MQLZP0KCcFT33
	rTO/EMyKSTn8b09YuTj3xL4WgiHgiwwli3EY+XKT28vTyZjRDdyfRZ+9zJC6YxMxTnIJ9/49j5W
	50is3VB4o6IrPcWHhGsz6oW9YxioZSz4=
X-Gm-Gg: AYBFou0L3CbfHnoJ0r9akrLiLP7ou1XRsqzGJnv2q+IFYHEb7q6QVCBVjkoFTeT63pB
	kxA6Nh8OmsMtMWqhmNS4CXMpg8WIF+w2vdTBTkHTz2LWdJ9fbYxs9VYnNcEZLV1NpX5Vn5CzjXv
	TpZX0/U53Uly/ckJ5/0AWXXgWf0nZQ16dJSSUN60uXi2IA4xKk7eraowHixyA0Q/eeg/h+ONirv
	t/LS+zcoNPQ7tGbJf0sFanTGoRmiRxHmKTLs8x5Ma6hoVNNqI0CY2FnemUFaARj2YDdqL8qFq41
	wYhpLETgLZAocuXoSmfZ0AwT6dLpxXEyNR0HrGPyTJVgEkWUe2njU/IvQtC3CYxFFk36eErC+wq
	aYOhZy7boEYUVEb2t98wPCmylVtD4EE9CvJK6WsEmeS3xq4pjswUwys5PIeiD
X-Received: by 2002:a05:6820:6fc4:b0:716:e2c3:e48 with SMTP id
 006d021491bc7-71ab50e864emr1017445eaf.58.1794563320647; Fri, 13 Nov 2026
 01:48:40 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260821201432.879450-1-Ashish.Kalra@amd.com>
In-Reply-To: <20260821201432.879450-1-Ashish.Kalra@amd.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Fri, 13 Nov 2026 10:48:29 +0100
X-Gm-Features: AclHuK-l_3UXJP1eTJDtPvdLhfXvgmrVR8-YQaX4h4dQv4VKuNhz7ofGxIqEsbY
Message-ID: <CAM9Jb+hD1Pq_fT7Km23vxTKf43MHUn0g5s1ue453WuN817gLBA@mail.gmail.com>
Subject: Re: [PATCH] x86/sev: Skip DR7 write during kexec when it would
 trigger an unserviceable #VC
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Srikanth Aithal <Srikanth.Aithal@amd.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Gupta, Pankaj" <pankaj.gupta@amd.com>
Content-Type: text/plain; charset="UTF-8"

> machine_kexec() calls hw_breakpoint_disable(), which writes DR7. On
> SEV-ES/SNP guests that do not have DebugSwap enabled, DR7 accesses are
> intercepted and delivered to the guest as a #VC exception, which must be
> serviced through the GHCB.
>
> By the time machine_kexec() runs, snp_kexec_finish() (called from
> native_machine_shutdown()) has already converted the per-CPU GHCBs and
> the boot GHCB back to private and set boot_ghcb to NULL, tearing down the
> GHCB infrastructure. The DR7 write therefore raises a #VC that
> dereferences a NULL GHCB pointer, causing a page fault and the kexec to
> fail.
>
> The NULL boot_ghcb pointer is a result of commit 3645eb7e3915 ("x86/fred:
> Fix early boot failures on SEV-ES/SNP guests"): that change makes
> __sev_get_ghcb() return the now-NULL boot_ghcb in this window, turning
> the previously-benign teardown-window #VC (a bogus VMGEXIT the host
> rejected but survived) into a NULL dereference.
>
> Skip the DR7 write in this case. Its value is not needed across kexec
> because the new kernel re-initializes DR7. Guests with DebugSwap enabled
> context-switch DR7 in hardware and do not intercept the write, and
> non-encrypted guests are unaffected, so both continue to call
> hw_breakpoint_disable() as before.
>
> Add a CC_ATTR_GUEST_DEBUG_VIRT confidential-computing attribute, so the
> debug-register-virtualization state (AMD DebugSwap) is queried through
> cc_platform_has().
>
> Reported-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
> Suggested-by: Tom Lendacky <thomas.lendacky@amd.com>
> Fixes: 3074152e56c9 ("x86/sev: Convert shared memory back to private on kexec")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> Tested-by: Srikanth Aithal <Srikanth.Aithal@amd.com>

I stumbled upon this issue while testing kexec on SNP on 7.4rc2.

I confirm this patch fixes issue for me.

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Tested-by: Pankaj Gupta <pankaj.gupta@amd.com>

Best regards,
Pankaj
