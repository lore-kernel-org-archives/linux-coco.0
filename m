Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD2034CFBE
	for <linux-coco@lists.linux.dev>; Wed, 18 Mar 2026 20:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773865839; cv=none; b=mXrFrmrQY2vcu5TADqqyZmlRXyn1A7R4ie5KXOItatYRVYEewTUVSpXLmLlL0BU5t8N8YzljW0nrIaggFvEh3J6koK1q6reWrOcp3YAlccb0PToTMeVSiyZd3/wzlTOs3WOZBoK/OW0SQbf+VHFvTKh0gZubnoexp/Z2re3SxlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773865839; c=relaxed/simple;
	bh=0Jvlq/8XR0iEgXTWN8DAOYkXN9axIafX6Am6mw6mKXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kuc1X2VEESweLvFmnexqhMdib61CcHk6fL5WP8Sa8rbIKim+lZTnsCVkIObWteJ439EiqDAi/C/ylSH1YumOynIn+pt0G94cZddRSCZjc0Z/aosBNCCHRCQ6FbiSU5SnZCU0fmFwVL7XADTEM3zabFyK0S4rd/xVcGVIP+LBIF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m0Qd0VNm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m0Qd0VNm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2aecc6b0861so1192395ad.2
        for <linux-coco@lists.linux.dev>; Wed, 18 Mar 2026 13:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773865838; x=1774470638; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ChN7tMYzceoBm3vKkl8w+3T0ks+P2wQ4DzqmsgtL3s=;
        b=m0Qd0VNm4QWqeN0hem7cUor+o022NSYdJLY2IqBX35kE9gO8sejob7lMeiEQnlLjFs
         usFeIDMvU8FskN+iPyCepljPcnBGR2h0LJEj7KO4mzKPHNs7uTLyN/93yaYtuPjb3on4
         CMfZ/Qe48B8I1pXn4tHk7J0PCiQr5UNLlOdlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773865838; x=1774470638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ChN7tMYzceoBm3vKkl8w+3T0ks+P2wQ4DzqmsgtL3s=;
        b=GJCYYXgpAol8MHJU4SKyhTWIlIKFmehnATA72pFsHTjRRhwuIPxXxCZK/1QTPbf63q
         T3Ye3lmqkNhJMXRkQkvzW8k9nG9dg71wB+/KQXQLn1aXOR86FY0pu9RskvMEzQY1qiwA
         Q9JcSKlphKxENuZk6m8g+orB7yARGvwB+DviDHmy/2+IYyP/MSv6Z+ToqF3xHwITvfqg
         gM+ytJyT9ydJiBat57sUiB+NM4AQAfXyr6zzBkJWiZ8yAVZgo/V4+oBg4I6Lby/Mfhjg
         5IuT8y9BRqootRykylSsIJqDiZu7QH5tYE6p7D7ACQXDsmgYUz5iXgT6OPY9KAk7iVtG
         Ytxw==
X-Forwarded-Encrypted: i=1; AJvYcCXdksKODTsjl8DwbmeofEtmspDvKrOW/RpJ7p7axgah7nVXTa6dsWNjTmSlhUidQpeSNb+RkkWKwq54@lists.linux.dev
X-Gm-Message-State: AOJu0YyRlyzsvvPwIMi2q55JFWfltZLYN8lvewBuErktlkzF7CIGJth4
	eLdAxgMwLibn6tfs2X2YNgOAs0JxEXEOG6fnUdKz85nZ8yA3cZ+yZJqbxn1aJr7JVA==
X-Gm-Gg: ATEYQzzFmNRf7nb3WGdwAeJkSjWURJQbC3iM5loX5rhtxYwgROpyAvy8YveOaDtaMPA
	qn3PHCF5aUShlUjMdB2PA2GVYrLhqAsCTtSrHHa7TGa3GW+XCYMcmB5OiTyptGdDCUMuq+YRk4b
	G+jFF1WBqXvvW9evJgKBy9Nz99NyvpV3KKs7D1qOgJZL7+eCV/rInpjZ3x7DvB1Rf6MCygwrd0l
	vKrPzFC2UZM3dBigkJdwEMcMm8NmyaZsZJyXnVNjbBThsKZIyZ1Oh4qzgXu8rtWUCUHYD0Lfx+i
	Df7GmtJa+OMytMaFT6HDYeCcIDBxafQArDuAT/7kC61jo2W8zAeoEJO+C0v9gn1BcwyY2GyBauH
	CaSw0xRwTItFNR2Sr8hAPkT8er39yc9D7HEXO43xssunJKXJOh3/1B1Ckgy9pmsliFoBos7whm3
	dOZkGTMuSG2vIrQ631
X-Received: by 2002:a17:902:d50e:b0:2b0:6df2:8cdb with SMTP id d9443c01a7336-2b06e21de42mr52463325ad.0.1773865837591;
        Wed, 18 Mar 2026 13:30:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:a:200:21ee:a76b:b098:63fe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e419b22sm39224235ad.11.2026.03.18.13.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 13:30:37 -0700 (PDT)
Date: Wed, 18 Mar 2026 21:30:26 +0100
From: Dmytro Maluka <dmaluka@chromium.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>,
	"open list:X86 TRUST DOMAIN EXTENSIONS (TDX)" <linux-coco@lists.linux.dev>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>
Subject: Re: [PATCH] KVM: TDX: Fix APIC MSR ranges in tdx_has_emulated_msr()
Message-ID: <absLYnREVR9ZNzxc@google.com>
References: <20260318190111.1041924-1-dmaluka@chromium.org>
 <94b06319-2be8-4f01-87d1-8989ae1ca85d@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94b06319-2be8-4f01-87d1-8989ae1ca85d@intel.com>

On Wed, Mar 18, 2026 at 12:42:59PM -0700, Dave Hansen wrote:
> It might also be handy to have a:
> 
> #define X2APIC_LAST_MSR(r)	(X2APIC_MSR(x)+APIC_ISR_NR-1)
> 
> so that the resulting code is a bit more readable:
> 
> 	case X2APIC_MSR(APIC_IRR) ... X2APIC_LAST_MSR(APIC_IRR):
> 
> Dmytro, if you feel a burning need to respin this, don't let me stop
> you. I can probably just fix this up when it gets applied, or Isaku can
> make those changes and resend it too.

Sure, please feel free to take over this. I even have no way to test it
anyway. :)

I'm hesitating whether X2APIC_LAST_MSR would be the best name for it,
given that it is for ISR/IRR/TMR only and is using APIC_ISR_NR (so
maybe, don't know, X2APIC_LAST_ISR_MSR?).
