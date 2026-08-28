Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BD086341
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941809; cv=none; b=lpM0bbidPJ0gvaFaV2PW9Fo8pUN0W1zkr8JtR503Wx4ds9m1j32fVfwTp7DCfQC9hdRxmsqG3CGxscg684qUpJ9UvTLlBhOmpcUcBcTagv68BGK0UC/BkPy7494CJ70Aycz7nR8S/LNMcNg9P2GkaZYbKdCcuvwlE7db6MnVw+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941809; c=relaxed/simple;
	bh=vKhe6i3FkAFwErgQ+z+E/6b1UcU6MpKf/+QS8ZIRiqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2GlvcT/Hjz9bGqVfEa3cv6pZTt0IEkudy0vgrnfrlGHkzpzLd3AwI+kANhed7vmAYaSlnsDIH54lVguGK++bMisPzUOimj1lKTwWu653wdSAMfA6pJ8CsXmhsxrprI02H64GP9ozlF7UZDX62qy4PputSQpPWgfFf+AI5m68VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NCfACnMn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NCfACnMn"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ccdf36f63dso12025ad.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 11:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787941808; x=1788546608; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ILzvij1drwo7+iGNKuxy4V2qVsnhp5pYEXxx5p1BgD0=;
        b=NCfACnMnb7spHggH+U6/wgrn4uTikM6JjmOSCh7RuiYq3xwx7eE6MlxV/DePKH5N+M
         KY+aF2JBblYAMMf8bv8j/E2W/lWaHip503f55OriYhqwYpcKteUb81taAT3GcHhRPdeH
         SVP24llxiQUv/g/QjAm6XPTz0NY0V3JfEwIyMfKMJEQzPUE+sKa481/HXmKlOuQuPAzW
         C9n7HZYMc99Ddnx2aaqKz112ykgnH/E1CyT+dInaM1dZe4dde3BtCYaRVVaJYDrYWm0n
         XNMtDYOwlywwuu8DSsbmZHZX76GltSKXsnLNV/suBiq6ygfF2/wog+lHMjfy9n/vbz04
         k1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787941808; x=1788546608;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILzvij1drwo7+iGNKuxy4V2qVsnhp5pYEXxx5p1BgD0=;
        b=QmI5OSouhwWxDg3+kacSq48KXIS0aphDQwGeLEhq4XY+f/9VVgtA23BdoG46BCTJ0b
         Ark7Y8H/pTV0c36g1MPCTYs0m7K/3jrT8oJec17sPtgkz3M2eMkFTvHwuo98hbJgru8g
         s9kRp5RWJDW93KvHpBHlTaCFIcPsfqjPoWfrimcG2P2NE4PjppxLE8eEe6y/BZAZYduc
         YBYa2V1j/PbLLQ3KeLtGzNIxmfM+lZrpc2MVM8y0Q8vre2IuUoz1TUHnh/lWhoYdRxSm
         3vFrBxKu/6jBMvwdqQ1jBFqRxSTKhMZz+9r1GOqTwHKQ/OPIYX2wKb0I4uKJOUT1aat7
         N6Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxYBfRVdxzmfPS9XBBYcw12z5+fPLuTJpkr62GmWzXr4J8n5Hael8kvj6a/UWQofUtBJmPgo8804V+v@lists.linux.dev
X-Gm-Message-State: AFuF++nf1j9sw6+HIS8qnzmBiOFxn4VM876YG6fvaTFzF+F6ZJGM2PBv
	oLEGInGIcECQ+7lZFyEDFxDla8Up6EX03nwqfJhj2fXaiss9GkrcIS+u33dOlW/9LA==
X-Gm-Gg: AYBFou1CCM9SVs+7mK6kMT3QU+h8bPPResHwCXRkc6yyUoMeGg0UFPw89K1we07pJ1o
	9QvoyelqMo1STblUz0XClxx+kJSDOIm5dzwbxnCrDnFnF1Iidvl5X6CaWf248F9MCv8pbZjgiFj
	EV+YpGsO5amMo+B4xfLei8Ver93CGj7rqBBjXcWsSgWEetqVWt/2a23uSW87fe9GyZyZYaUDl0b
	wnSTJY7N+6YCcU2WHzweIooVwhmRgT3vJdRkC4gUfEACWj7lvYaM4vy8/A+P/nbJWkXQj7OTzc4
	KIiNhfq8aAz1b+pF8SThCo8RVZwYXdR0V7zyRfYFahGBBC1We6IcM6kfq1BD96tZWdn7MMd/+Xg
	Cz/xXD4k1+jNt+UeCdoYIcmU4ZS98Ocgog01DZ+DixOBMrV7Wa3rS8xhMnYVPXa2vebn9X8LFQl
	MpSQqrMfPyuD/bp6nza1Dv/IHaKjE2vJs0dK5Lle01GuBntzATotQDTKMMLzwaldCmI+CeJa5tt
	zPhZ9N8hapd5Cks7mcQFWiq
X-Received: by 2002:a17:903:988:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2d8dfb0b68dmr662305ad.1.1787941807055;
        Fri, 28 Aug 2026 11:30:07 -0700 (PDT)
Received: from google.com (139.58.247.35.bc.googleusercontent.com. [35.247.58.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2309637sm1500859a91.0.2026.08.28.11.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:30:05 -0700 (PDT)
Date: Fri, 28 Aug 2026 18:30:01 +0000
From: Lisa Wang <wyihan@google.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Aktas, Erdem" <erdemaktas@google.com>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"afranji@google.com" <afranji@google.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>,
	"ira.weiny@intel.com" <ira.weiny@intel.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Chatre, Reinette" <reinette.chatre@intel.com>,
	"isaku.yamahata@intel.com" <isaku.yamahata@intel.com>,
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"pratikrajesh.sampat@amd.com" <pratikrajesh.sampat@amd.com>,
	"oupton@kernel.org" <oupton@kernel.org>,
	"sagis@google.com" <sagis@google.com>,
	"Gao, Chao" <chao.gao@intel.com>,
	"Wang, Roger" <runanwang@google.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"Qiang, Chenyi" <chenyi.qiang@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"jmcrey@google.com" <jmcrey@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Hunter, Adrian" <adrian.hunter@intel.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v14 00/22] TDX KVM selftests
Message-ID: <apHTqWg1hDXpvhgE@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <5a44a6925715e1edbd379ac0ea5526ec990eb819.camel@intel.com>
 <4828f8e29801adb29a4d48b8980d3b3a0a813e06.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4828f8e29801adb29a4d48b8980d3b3a0a813e06.camel@intel.com>

On Thu, Aug 13, 2026 at 11:05:17PM +0000, Edgecombe, Rick P wrote:
> --- a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c
> +++ b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c
> @@ -5,7 +5,7 @@
>  
>  #include "tdx/td_boot.h"
>  
> -static void __used common(void)
> +static void __attribute__((used)) common(void)
>  {
>         OFFSET(TD_BOOT_PARAMETERS_CR0, td_boot_parameters, cr0);
>         OFFSET(TD_BOOT_PARAMETERS_CR3, td_boot_parameters, cr3);
>
Thanks for testing this! The patch series posted here on the mailing
list is correct, but I made the mistake when pushing the code to the
branch.

I have just force-pushed the fix to the branch. It should compile
correctly now. Could you please pull the latest version and give it
another try?

Lisa
