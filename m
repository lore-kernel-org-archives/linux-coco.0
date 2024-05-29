Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE6314A61E
	for <linux-coco@lists.linux.dev>; Wed, 29 May 2024 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716982780; cv=none; b=NZOjvU9UEilK+S9uI0Rx0kkAc9fJERgpI83ey4wAHaoQghFo+i+8/oFORzzb2Td0DtUjiciHoxVSDM98Mt47Pje3u83WKmP5j4OJcryl8NHghGn15fVlx+y/dWlUjJLAEBTOvxu+/5O1kdf+TAx1ZYMRPP7PX58Q1zEkwKpb8tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716982780; c=relaxed/simple;
	bh=ydja5ABopWv3H3E435qacVly16lftEf0fcwfsjpRf8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqyuR2zdSgp+bMAQOAUagBZWZRRv9X3hYJqPCnwo0eraL2X2vFUSClw7TaDHaOUrI0fmYrzQqt8QlygFyaZs9byYMx9Gda1/OZFqtpMwSlCAvzME8gI1vwPJY4iSaFcIW7/loGTswFnBuyPVXdDgkVCtTjTQiIMmPkQMtQHYfBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cEmHbC4z; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cEmHbC4z"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-35502a992c9so2036269f8f.3
        for <linux-coco@lists.linux.dev>; Wed, 29 May 2024 04:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716982776; x=1717587576; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EdFeXZ0iZQwHyJpJ9sEUFEvxz5pnqM5Lhk7k33g54Ts=;
        b=cEmHbC4zZphStFU3vvLyP3fNFZdGFp6yaNna8kdbfhMu3xBKnaT8eOc0vjh5735xpM
         JHPWpTe8R6DcjUcQwnSH2PdB3+CC/1CJQLrVXrC2o3erwd/5xwcY0WpgxJ8EyxkjW7PG
         U4Pjm0FoYQ86k0OLqPeUJXJxVHmlT3QuPTLeXNv9jt8mKqwlFx331jPYAwaD3OyNTCvJ
         enRfgwssOvw1JQAJMeNb3BOYhQVojiT6V5OJZgB1cheYCt9uPBmDBr0hIxJVnf3YfnuQ
         kvwPw1oZlRyQpGBCPqf1ykVt95t74cRPOlqYt2MA9zMUVjsx2cm5W2yAYLuJw+EQSpTQ
         M15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716982776; x=1717587576;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EdFeXZ0iZQwHyJpJ9sEUFEvxz5pnqM5Lhk7k33g54Ts=;
        b=qSZVqUH36rdgcurNcpzK/rTLZY+UPMvFCTIvOaogKz23SCk9P38B6yt98TYQIc4ynu
         Ne7fglKCfp2kFqQz3r1MlSraJGz0cSThfs9VJEJjCoBMFnuAVmRXu+lz8fgzIqYigf4/
         HhQlcPDw9bIbK8BpLL0c07QXOj89Mw3yLSbPxU1zJ17dL7Ws4p//LZdhNJVTyc83Z3pb
         cgxQr43fgmupOxUanJ/Bh6quFptYYtcRvnQNsXHB4vwJowOFaWlxgtLmpo7bYppXuEt7
         5LQ4RyT2Efn6ElOPWRFCFCDs2+74Hx7+sAhW9c2Dq64YiDpFA7V2KxVsJuJE/O4nu7XF
         UoOw==
X-Forwarded-Encrypted: i=1; AJvYcCXQMMdFtlZ61kA4GjnHMk5yohML2Njqm1AlqcXyP0Ps893stQeNmeiDpjmlhuWUQ6zmgCFIF9lp1Yd/5zjoXaYCkpMmuXgWXpWpPA==
X-Gm-Message-State: AOJu0YxnM+UZXxeARoZibF+zO0r34E+/6pJCeALQ6Yh8umynE+VXo0FK
	yd9USx+GhsXTuyd2/SpAvXJWu/CC/2x0WRDhC84dkQ0miT06A77QW5HK4GYLUQ0=
X-Google-Smtp-Source: AGHT+IGhbyPCV7mhFEb+wa2zxVQsRfFFyIuyAeyXPnnporhcsU+et7sVZoAC9sjK3Qz8qHTU2qJsiQ==
X-Received: by 2002:a5d:62cc:0:b0:354:d098:8d67 with SMTP id ffacd0b85a97d-3552fe179a1mr12680946f8f.57.1716982776439;
        Wed, 29 May 2024 04:39:36 -0700 (PDT)
Received: from ?IPV6:2a10:bac0:b000:5de0:ca17:8dd8:7313:d6fd? ([2a10:bac0:b000:5de0:ca17:8dd8:7313:d6fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c93a5sm14633282f8f.70.2024.05.29.04.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 04:39:36 -0700 (PDT)
Message-ID: <46ddc54e-f7bb-4de3-b311-faee12e5a6b9@suse.com>
Date: Wed, 29 May 2024 14:39:33 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv11 06/19] x86/kexec: Keep CR4.MCE set during kexec for TDX
 guest
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish"
 <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>,
 "Huang, Kai" <kai.huang@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
 Baoquan He <bhe@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, kexec@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240528095522.509667-1-kirill.shutemov@linux.intel.com>
 <20240528095522.509667-7-kirill.shutemov@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <20240528095522.509667-7-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28.05.24 г. 12:55 ч., Kirill A. Shutemov wrote:
> TDX guests run with MCA enabled (CR4.MCE=1b) from the very start. If
> that bit is cleared during CR4 register reprogramming during boot or
> kexec flows, a #VE exception will be raised which the guest kernel
> cannot handle it.
> 
> Therefore, make sure the CR4.MCE setting is preserved over kexec too and
> avoid raising any #VEs.
> 
> The change doesn't affect non-TDX-guest environments.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
