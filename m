Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D751526F291
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 05:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768456513; cv=none; b=pYHA3LaEGH6Fo6iw3TG82A62PqVeSxay1S5Npea52+Mtgmk+mEmygwGCbsPb1TOsZQ78uIlY23+zuvHm96k9cvDYEsT/W18/qJO34+Sht8hE/ASlOy615B1Zm+ylJL7CzUZOc3HMk/yLkw6H6ln367wx2Egor22Jq2LUbnpHEFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768456513; c=relaxed/simple;
	bh=Y1zY4JfgbOJVOGuoztmGS9eKRdBKhNP0s+delX/twGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DF4/5mJtG2/tAKtUFYq3e6iQyU+gjvXkt++Asi9A2O6hzzdwEGV5g3n8cRs2e929XkRdvn4N54rt5OnWCtb2qfkgGO9guEUGCKiT67Bs/TkMsKVdCjxybdpzB0iAMNc8bZ/HrHZBkgIkybdHZ/Ulss0jOtv8nUTlLJU5jdft1vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVRmR5ci; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVRmR5ci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768456512; x=1799992512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y1zY4JfgbOJVOGuoztmGS9eKRdBKhNP0s+delX/twGo=;
  b=fVRmR5cicQzQdCx8/N7/RVQcmcibguZre403870rmLSH8bm76dj+wg+N
   vCHQh5pcoiVHU82AhBTWAi29DG4hzXDnPXEjUZlPdoQ+Gojp6AkmkzuVw
   mhpbkttsX8ZXqGwgyHURGYscozNMP1gqPCLHcNS2FNLvq1rg28CwHo+Ip
   /GV6BKJ6jvAYcIpJ3FgFkNXMM866YY0+/qRKZmNsJ3g1nlHc/+mdJAWJK
   PRbtrKRQnwz+1G6Hm9er3Rn/o9r6S7pKN36jUr/0Jg7e6LxaRtImy1cfg
   LTDl9gGSKiu1qtJeTukkr6tcW1pQZUsI/PYTjVf6MtrNcVn35tWjfXWXC
   Q==;
X-CSE-ConnectionGUID: Ww6YXwCVRCe056qMXVjwxA==
X-CSE-MsgGUID: WF6eAPy1QsCo1IaDXxs3tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92430537"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="92430537"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:55:11 -0800
X-CSE-ConnectionGUID: y5UrLV02RYSOdb8sd9cZ9A==
X-CSE-MsgGUID: tOag9CcxQKCMIx0+8HngvQ==
X-ExtLoop1: 1
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jan 2026 21:55:07 -0800
Date: Thu, 15 Jan 2026 13:37:34 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, reinette.chatre@intel.com, ira.weiny@intel.com,
	kai.huang@intel.com, dan.j.williams@intel.com, sagis@google.com,
	vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com,
	Farrah Chen <farrah.chen@intel.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 16/21] x86/virt/seamldr: Handle TDX Module update
 failures
Message-ID: <aWh9HiqO4NWuFBwu@yilunxu-OptiPlex-7050>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-17-chao.gao@intel.com>
 <aQAwRrvYMcaMsu02@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQAwRrvYMcaMsu02@intel.com>

>  static void print_update_failure_message(void)
> @@ -331,7 +323,7 @@ static int do_seamldr_install_module(void *params)
> 			touch_nmi_watchdog();
> 			rcu_momentary_eqs();
> 		}
> -	} while (curstate != TDP_DONE);
> +	} while (curstate != TDP_DONE && !atomic_read(&tdp_data.failed));

Ah, yes. That's idea of immediate error out I'm thinking of, your
implementation is better.

>  
> 	return ret;
>  }
> 
