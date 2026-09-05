Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977BB33998;
	Sat,  5 Sep 2026 17:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788628852; cv=none; b=P1Mk87sNB4dW4rBSJqZqAyKtLb6lDomgpku2Z7Up55ydFX3+hq8iWm1LfyZrnCqgnJa7KJ0TDbvlyMz6XtcB4AU+ToA3Xi1CbJul+mpuKwGFGN744g0t46P8J5yypmaxR+zmsFQClphhMrSldAgMO1jdC4g5w6hLBr2l+xIbDIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788628852; c=relaxed/simple;
	bh=8TIG/jfkIYyQW+06/2239Ev3S/Qj+y4AEk62Rx9r5vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=td2Fu4G2FrEwtjBqRTTYEiwjIMPijwXlHq5IAgxkF7BDRxNWlOBcng6oIkCBeBB7Zca4V951gqQqZNo/EXqLml/aDBu9rFJiv2Igwo7f5Cfx3qLAqILvPoFk45N5na4E9HmQ4IzlmM+Z2utwnP9cByVG3A8x8M3xL63NKf+Yc/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XsfzegK4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XsfzegK4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=IoL1Ze11QVjAA3JvCTX4j7BXubDlKNVIpCFs7KHZQ+U=; b=XsfzegK4XFSE5abPBkDsgroWUm
	N30YhWnbAXR/4J1anujv31dEi0Kb/teDFM8SRLYpnjBoemyd3n7ZE8yxex3zelpR7t2GLimbf5xOy
	yrk0JeuBHeWNTCIMnPcAT9j1UAhOWq0ATOG8168ZzRRzk4MyZMIFwtKvwsAHDvC8LOuJi1Ri8EMKq
	8E626pSLdvxVqJ8FraLFOjPrCmuar8vx1k5OzUpq/1nRbu+RkThOvqSox8vgJmsvw4gJBWMeyNffl
	NiymVt1/nah2vNG0A+pQ3aFF6caGAqP912ppUKIJArLSfIXQGGMBnrv99UN2ri2zDl00vWrhn5729
	3gaSSy4Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2u4P-00000004Hpm-34Tk;
	Sat, 05 Sep 2026 17:20:49 +0000
Message-ID: <e0e25f66-a1a9-4851-8b5e-0a86220311e3@infradead.org>
Date: Sat, 5 Sep 2026 10:20:49 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: virt: Fix the struct
 snp_guest_request_ioctl name in sev-guest.rst
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
Cc: Ashish Kalra <ashish.kalra@amd.com>, linux-coco@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, Brijesh Singh <brijesh.singh@amd.com>
References: <20260905092942.41558-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905092942.41558-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/26 2:29 AM, Karl Mehltretter wrote:
> struct snp_user_guest_request does not exist; the name is struct
> snp_guest_request_ioctl.
> 
> Use the real name.
> 
> Fixes: fce96cf04430 ("virt: Add SEV-SNP guest driver")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
thanks.

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

-- 
~Randy
