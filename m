Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735C935E1A8
	for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 19:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500528; cv=none; b=YX7CWLVZfw2PShVNuTyRahnoUyJP5TWvn5ScvkEA9q+A/AcgzoftOmaDQ4ZZhXRjfwEL+HocdvKyzk6k2f7e0hLE7KKXCCO7U2ALZQE+FqQkdfFrEQ15tvaXVxAhTY2tBsxUkyQ8tT0eixeHS+R9/w5TuA/ZxSPD48m4iZE0K3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500528; c=relaxed/simple;
	bh=wCkqkQXMa8sVgJQBZjlhAvSqQEwNwJOLJ2Nu8xKLLec=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aX4ErBs9zeWAuGXmqvJJpOMjRytWZOj2jrnTtWuspWhVf8QM+O1uGMeULoOVN5AuIcVV8ZascKTJ7F4QJy7eFKtDY0MpD02BqPiD6niZEsp3m8eV8xg+j1iS5Ue4mSFeuCxu9W/kNEVFbXAN6sonriX+/uxmMgikls9db74jD6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kmQweSt8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kmQweSt8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 902FE4090B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789500526; bh=6YHzUD+wsB8DLUyn7slUCY+23u08dP+WzLoIhAnZePI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kmQweSt8yUsKG/xe71sHy1NG7VKv6lZVbDA9eLiueusd4sIWsH6hHxSulgLgTF7nj
	 JsTD+dyF+N0uyGc8Tx9ssMEgxDxeTxUrKyQk8dePHcpxl3JUpHatK9RQuBSj7GJd0h
	 s1t0c0h+w0cqvvltMxe0xS2nOvDX3SWtGoNI/NjPhK2ziA98i95kupPhJtC3Za8FkS
	 PGJf3ZPiwi+CN8RVOpRPUz6r5xxkdv8/fCWjwmyi/pU00vPew5MtIWGNN3eZ6racj6
	 M/0jjN1dX3M29AeuMKXp6OslJuTKPkLuj7B8IHqZI+EJo6yfB187zWGBrJh/BsP+YO
	 YbnCfN2wPvQ5Q==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 902FE4090B;
	Tue, 15 Sep 2026 19:28:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>, Tom Lendacky
 <thomas.lendacky@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Ashish Kalra
 <ashish.kalra@amd.com>, linux-coco@lists.linux.dev,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [PATCH] Documentation: virt: Fix the struct
 snp_guest_request_ioctl name in sev-guest.rst
In-Reply-To: <20260905092942.41558-1-kmehltretter@gmail.com>
References: <20260905092942.41558-1-kmehltretter@gmail.com>
Date: Tue, 15 Sep 2026 13:28:45 -0600
Message-ID: <878q528gb6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> struct snp_user_guest_request does not exist; the name is struct
> snp_guest_request_ioctl.
>
> Use the real name.
>
> Fixes: fce96cf04430 ("virt: Add SEV-SNP guest driver")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/virt/coco/sev-guest.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/virt/coco/sev-guest.rst b/Documentation/virt/coco/sev-guest.rst
> index 93debceb6eb0..3371ebc29e8b 100644
> --- a/Documentation/virt/coco/sev-guest.rst
> +++ b/Documentation/virt/coco/sev-guest.rst
> @@ -38,7 +38,7 @@ along with a description:
>        are not detailed, but errors with specific meanings are.
>  
>  The guest ioctl should be issued on a file descriptor of the /dev/sev-guest
> -device.  The ioctl accepts struct snp_user_guest_request. The input and
> +device.  The ioctl accepts struct snp_guest_request_ioctl. The input and
>  output structure is specified through the req_data and resp_data field
>  respectively. If the ioctl fails to execute due to a firmware error, then
>  the fw_error code will be set, otherwise fw_error will be set to -1.

Applied, thanks.

jon
